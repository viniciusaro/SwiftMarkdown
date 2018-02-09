import Foundation

public final class BoldMarkdownProperty: MarkdownProperty {
    public var prefix: String {
        return "\\*\\*"
    }
    
    public var suffix: String {
        return "\\*\\*"
    }
    
    public func transform(string original: NSAttributedString) -> NSAttributedString {
        return original.withSymbolicTraits(.traitBold)
    }
}
