import Foundation

final class ItalicMarkdownProperty: MarkdownProperty {
    var prefix: String {
        return "\\*"
    }
    
    var suffix: String {
        return "\\*"
    }
    
    var prefixSize: Int {
        return 1
    }
    
    var suffixSize: Int {
        return 1
    }
    
    var needsEscaping: Bool {
        return true
    }
    
    func transform(string original: NSAttributedString) -> NSAttributedString {
        return original.withSymbolicTraits(.traitItalic)
    }
}
