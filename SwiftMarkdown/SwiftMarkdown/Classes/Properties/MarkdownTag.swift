import Foundation

public struct MarkdownTag: ExpressibleByStringLiteral {
    public let value: String
    
    public var sanitized: String {
        return self.value
            .replacingOccurrences(of: "\\", with: "")
            .replacingOccurrences(of: "^", with: "")
    }
    
    public init(_ value: String) {
        self.value = value
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.value = value
    }
    
    public init(stringLiteral value: String) {
        self.value = value
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.value = value
    }
}
