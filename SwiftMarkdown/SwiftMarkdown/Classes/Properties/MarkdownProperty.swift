import Foundation

public protocol MarkdownProperty {
    var prefix: MarkdownTag { get }
    var suffix: MarkdownTag { get }
    var bodyPattern: String { get }
    func transform(string original: NSAttributedString) -> NSAttributedString
}

public extension MarkdownProperty {
    var bodyPattern: String {
        return "(.+?)"
    }
    
    var pattern: String {
        return self.prefix.value + self.bodyPattern + self.suffix.value
    }
    
    var regex: NSRegularExpression? {
        return try? NSRegularExpression(pattern: self.pattern, options: [.caseInsensitive,
                                                                         .anchorsMatchLines,
                                                                         .dotMatchesLineSeparators])
    }
}
