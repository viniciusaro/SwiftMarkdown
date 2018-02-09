import Foundation

public final class BoldMarkdownProperty: MarkdownProperty {
    public var prefix: MarkdownTag {
        return "\\*\\*"
    }
    
    public var suffix: MarkdownTag {
        return "\\*\\*"
    }
    
    public func transform(string original: NSAttributedString) -> NSAttributedString {
        return original.withSymbolicTraits(.traitBold)
    }
}
