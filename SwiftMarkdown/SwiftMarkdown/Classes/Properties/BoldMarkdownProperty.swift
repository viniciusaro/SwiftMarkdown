import Foundation

final class BoldMarkdownProperty: MarkdownProperty {
    var prefix: String {
        return "\\*\\*"
    }
    
    var suffix: String {
        return "\\*\\*"
    }
    
    func transform(string original: NSAttributedString) -> NSAttributedString {
        return original.withSymbolicTraits(.traitBold)
    }
}
