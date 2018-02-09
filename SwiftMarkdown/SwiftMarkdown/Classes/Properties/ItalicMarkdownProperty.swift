import Foundation

public final class ItalicMarkdownProperty: MarkdownProperty {
    public var prefix: MarkdownTag {
        return "\\*"
    }
    
    public var suffix: MarkdownTag {
        return "\\*"
    }
    
    public func transform(string original: NSAttributedString) -> NSAttributedString {
        return original.withSymbolicTraits(.traitItalic)
    }
}
