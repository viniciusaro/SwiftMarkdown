public final class HeaderMarkdownProperty: MarkdownProperty {
    
    private static let maxNumber: UInt = 6
    
    private let number: UInt
    
    private let scaleTable: [String: CGFloat] = [
        "#": 2,
        "##": 1.5,
        "###": 1.17,
        "####": 1,
        "#####": 0.83,
        "######": 0.67,
    ]

    private var sizeFactor: CGFloat {
        return self.scaleTable[self.prefix] ?? 1
    }
    
    public var prefix: String {
        return "#".repeated(self.number)
    }
    
    public var suffix: String {
        return "\\n"
    }
    
    public init(_ number: UInt) {
        self.number = min(number, HeaderMarkdownProperty.maxNumber)
    }
    
    public func transform(string original: NSAttributedString) -> NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: original)
        
        let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        let currentFont = original.attribute(.font, at: 0, effectiveRange: nil) as? UIFont ?? defaultFont
        
        let size = currentFont.fontDescriptor.pointSize * self.sizeFactor
        let font = UIFont(descriptor: currentFont.fontDescriptor, size: size)
        
        mutable.addAttribute(.font, value: font, range: original.string.fullRange)
        return mutable
    }
}
