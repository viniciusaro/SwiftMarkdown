import Foundation

final class ItalicMarkdownProperty: MarkdownProperty {
    var prefix: String {
        return "\\*"
    }
    
    var suffix: String {
        return "\\*"
    }
    
    func transform(string original: NSAttributedString) -> NSAttributedString {
        return original.withSymbolicTraits(.traitItalic)
    }
}
