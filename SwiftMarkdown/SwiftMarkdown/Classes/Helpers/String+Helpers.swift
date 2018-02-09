import Foundation

extension String {
    var fullRange: NSRange {
        return NSRange.init(location: 0, length: self.count)
    }
}

extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

extension String {
    func repeated(_ times: UInt) -> String {
        var string = ""
        for _ in 0..<times {
            string += self
        }
        return string
    }
}
