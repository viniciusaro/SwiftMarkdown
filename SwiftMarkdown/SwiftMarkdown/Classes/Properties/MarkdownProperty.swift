import Foundation

public protocol MarkdownProperty {
    var prefix: String { get }
    var suffix: String { get }
    var bodyPattern: String { get }
    func transform(string original: NSAttributedString) -> NSAttributedString
}

public extension MarkdownProperty {
    var bodyPattern: String {
        return "(.+?)"
    }
    
    var pattern: String {
        return self.prefix + self.bodyPattern + self.suffix
    }
    
    var regex: NSRegularExpression? {
        return try? NSRegularExpression(pattern: self.pattern, options: [.caseInsensitive])
    }
}
