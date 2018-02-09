import UIKit

final class StrikethroughMarkdownProperty: MarkdownProperty {
    var prefix: MarkdownTag {
        return "~~"
    }
    
    var suffix: MarkdownTag {
        return "~~"
    }
    
    func transform(string original: NSAttributedString) -> NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: original)
        mutable.addAttribute(.strikethroughStyle, value: 2, range: original.string.fullRange)
        return mutable
    }
}
