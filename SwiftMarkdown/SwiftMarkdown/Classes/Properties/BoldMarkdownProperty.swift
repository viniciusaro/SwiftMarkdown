import Foundation

final class BoldMarkdownProperty: MarkdownProperty {
    var prefix: String {
        return "\\*\\*"
    }
    
    var suffix: String {
        return "\\*\\*"
    }
    
    var suffixSize: Int {
        return 2
    }
    
    var prefixSize: Int {
        return 2
    }
    
    func transform(string original: NSAttributedString) -> NSAttributedString {
        return original.withSymbolicTraits(.traitBold)
    }
}
