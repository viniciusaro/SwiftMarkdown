import Foundation

public final class EmptyMarkdownProperty: MarkdownProperty {
    public var prefix: MarkdownTag {
        return ""
    }
    
    public var suffix: MarkdownTag {
        return ""
    }
    
    public var bodyPattern: String {
        return "."
    }
    
    public func transform(string original: NSAttributedString) -> NSAttributedString {
        return original
    }
}
