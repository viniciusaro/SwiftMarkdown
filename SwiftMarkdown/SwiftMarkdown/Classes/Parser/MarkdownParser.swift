import Foundation

final class MarkdownParser {
    private let properties: [MarkdownProperty]
    private let combinedPattern: String
    
    init(properties: [MarkdownProperty]) {
        self.properties = properties + [EmptyMarkdownProperty()]
        self.combinedPattern = String(self.properties.reduce("(", { $0 + $1.pattern + "|" }).dropLast() + ")")
    }
    
    func unfailableParse(string: String) -> TokenResult {
        return (try? self.parse(string: string)) ?? .empty
    }
    
    func parse(string: String) throws -> TokenResult {
        var tokens: [Token] = []
        let options = [.caseInsensitive, .anchorsMatchLines] as NSRegularExpression.Options
        let regularExpression = try NSRegularExpression(pattern: self.combinedPattern, options: options)
        let matchingOptions: NSRegularExpression.MatchingOptions = .reportProgress
        let matches = regularExpression.matches(in: string, options: matchingOptions, range: string.fullRange)
        
        for match in matches {
            let property = self.findPropertyFor(match: match, string: string, options: matchingOptions)
            
            let from = match.range.location
            let to = match.range.location + match.range.length
            let prefix = property.prefix.sanitized
            let suffix = property.suffix.sanitized
            
            let value = string[from..<to]
            let token = value
                .replacingOccurrences(of: prefix, with: "")
                .replacingOccurrences(of: suffix, with: "")
            
            tokens.append(Token(value: token, matchRange: match.range, property: property))
        }
        
        return TokenResult(tokens: tokens)
    }
    
    private func findPropertyFor(match: NSTextCheckingResult,
                                 string: String,
                                 options: NSRegularExpression.MatchingOptions) -> MarkdownProperty {
        
        for property in self.properties {
            if let regex = property.regex, regex.numberOfMatches(in: string, options: options, range: match.range) > 0 {
                return property
            }
        }
        return EmptyMarkdownProperty()
    }
}
