import Foundation

public final class EmptyMarkdownProperty: MarkdownProperty {
    public var prefix: String {
        return ""
    }
    
    public var suffix: String {
        return ""
    }
    
    public var bodyPattern: String {
        return "."
    }
    
    public func transform(string original: NSAttributedString) -> NSAttributedString {
        return original
    }
}
