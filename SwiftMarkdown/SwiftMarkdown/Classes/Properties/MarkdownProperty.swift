import Foundation

public protocol MarkdownProperty {
    var prefix: String { get }
    var suffix: String { get }
    var prefixSize: Int { get }
    var suffixSize: Int { get }
    var bodyPattern: String { get }
    func transform(string: NSAttributedString) -> NSAttributedString
}

extension MarkdownProperty {
    var bodyPattern: String {
        return "[\\w\\d .,&%#@$]*"
    }
    
    var prefixSize: Int {
        return self.prefix.count
    }
    
    var suffixSize: Int {
        return self.suffix.count
    }
    
    var pattern: String {
        return self.prefix + self.bodyPattern + self.suffix
    }
    
    var regex: NSRegularExpression? {
        return try? NSRegularExpression(pattern: self.pattern, options: [.caseInsensitive])
    }
}
