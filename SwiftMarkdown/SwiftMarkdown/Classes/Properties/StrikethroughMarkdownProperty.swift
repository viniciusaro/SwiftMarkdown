import UIKit

final class StrikethroughMarkdownProperty: MarkdownProperty {
    var prefix: String {
        return "~~"
    }
    
    var suffix: String {
        return "~~"
    }
    
    func transform(string original: NSAttributedString) -> NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: original)
        mutable.addAttribute(.strikethroughStyle, value: 2, range: original.string.fullRange)
        return mutable
    }
}
