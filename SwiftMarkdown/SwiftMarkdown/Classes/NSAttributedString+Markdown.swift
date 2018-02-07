import Foundation
import UIKit

extension NSAttributedString {
    public var markdown: NSAttributedString {
        return self.markdown(withProperties: [
            BoldMarkdownProperty(),
            ItalicMarkdownProperty(),
            StrikethroughMarkdownProperty()
        ])
    }
    
    public func markdown(withProperties properties: [MarkdownProperty]) -> NSAttributedString {
        let parser = MarkdownParser(properties: properties)
        var result = parser.unfailableParse(string: self.string)
        var final = self
        
        while result.hasNonEmptyTokens {
            let mutable = NSMutableAttributedString()
            
            for token in result.tokens {
                let attributed = final.attributedSubstring(from: token.range)
                let transformed = token.property.transform(string: attributed)
                mutable.append(transformed)
            }
            
            final = mutable
            result = parser.unfailableParse(string: mutable.string)
        }
        
        return final
    }
}
