import Foundation

public final class ItalicMarkdownProperty: MarkdownProperty {
    public var prefix: String {
        return "\\*"
    }
    
    public var suffix: String {
        return "\\*"
    }
    
    public func transform(string original: NSAttributedString) -> NSAttributedString {
        return original.withSymbolicTraits(.traitItalic)
    }
}
