import Foundation

public struct TokenResult {
    public let tokens: [Token]
    
    public var nonEmptyTokens: [Token] {
        return self.tokens.filter({ $0.property is EmptyMarkdownProperty == false })
    }
    
    public var hasNonEmptyTokens: Bool {
        return self.nonEmptyTokens.count > 0
    }
    
    public static var empty: TokenResult {
        return TokenResult(tokens: [])
    }
}

public struct Token {
    let value: String
    let range: NSRange
    let property: MarkdownProperty
}

public final class MarkdownParser {
    private let properties: [MarkdownProperty]
    private let combinedPattern: String
    
    public init(properties: [MarkdownProperty]) {
        self.properties = properties + [EmptyMarkdownProperty()]
        self.combinedPattern = String(self.properties.reduce("(", { $0 + $1.pattern + "|" }).dropLast() + ")")
    }
    
    public func unfailableParse(string: String) -> TokenResult {
        return (try? self.parse(string: string)) ?? .empty
    }
    
    public func parse(string: String) throws -> TokenResult {
        var tokens: [Token] = []
        let regularExpression = try NSRegularExpression(pattern: self.combinedPattern, options: [.caseInsensitive])
        let options: NSRegularExpression.MatchingOptions = .reportProgress
        let matches = regularExpression.matches(in: string, options: options, range: string.fullRange)
        
        for match in matches {
            let property = self.findPropertyFor(match: match, string: string, options: options)
            
            let from = match.range.location + property.prefixSize
            let to = match.range.location + match.range.length - property.suffixSize
            
            let rangeLength = match.range.length - property.prefixSize - property.suffixSize
            let range = NSRange(location: from, length: rangeLength)
            
            let token = string[from..<to]
            tokens.append(Token(value: token, range: range, property: property))
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
