# SwiftMarkdown

SwiftMarkdown is library for parsing and formatting strings with markdown tags

## Usage

Simply mark your strings with markdown tags and then use the `markdown` property of your already created NSAttributedStrings

```swift
let string = "SWIFT **MARKDOWN** LIBRARY"
let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)]
let attributed = NSAttributedString(string: string, attributes: attributes)
label.attributedText = attributed.markdown
```

This is how your label will look like: 
![GitHub Logo](https://github.com/viniciusaro/SwiftMarkdown/blob/master/SwiftMarkdown/SwiftMarkdownTests/ReferenceImages/SwiftMarkdownTests/should_render_correctly__with_bold_string%403x.png)

## License

SwiftMarkdown is released under an MIT license.
