import UIKit

extension NSAttributedString {
    func withSymbolicTraits(_ traits: UIFontDescriptorSymbolicTraits) -> NSAttributedString {
        var range = self.string.fullRange
        let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        let font = self.attribute(.font, at: 0, effectiveRange: &range) as? UIFont ?? defaultFont
        
        guard let fontWithoutAttributes = UIFont(name: font.fontName, size: font.fontDescriptor.pointSize),
            let newFontDescriptor = fontWithoutAttributes.fontDescriptor.withSymbolicTraits(traits) else {
                return self
        }
        
        let mutable = NSMutableAttributedString(attributedString: self)
        let newFont = UIFont(descriptor: newFontDescriptor, size: 0)
        mutable.addAttributes([.font: newFont], range: range)
        return mutable
    }
}

