import Foundation

final class EmptyMarkdownProperty: MarkdownProperty {
    var prefix: String {
        return ""
    }
    
    var suffix: String {
        return ""
    }
    
    var bodyPattern: String {
        return "."
    }
    
    func transform(string original: NSAttributedString) -> NSAttributedString {
        return original
    }
}
