struct Token {
    let value: String
    let matchRange: NSRange
    let property: MarkdownProperty
}

struct TokenResult {
    let tokens: [Token]
    
    var nonEmptyTokens: [Token] {
        return self.tokens.filter({ $0.property is EmptyMarkdownProperty == false })
    }
    
    var hasNonEmptyTokens: Bool {
        return self.nonEmptyTokens.count > 0
    }
    
    static var empty: TokenResult {
        return TokenResult(tokens: [])
    }
}
