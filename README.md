# SwiftMarkdown

SwiftMarkdown is library for parsing and formatting strings with markdown tags

![Travis](https://travis-ci.org/viniciusaro/SwiftMarkdown.svg?branch=master)

![Bare String With Multiple Formatting](https://github.com/viniciusaro/SwiftMarkdown/blob/master/SwiftMarkdown/SwiftMarkdownTests/ReferenceImages/SwiftMarkdownTests/should_render_correctly__with_multiple_lines_text@3x.png)

## Usage

To have your label formatted like the above your code would look like the following:

```swift
let string = """
  Swift **Markdown** Library \n
  Swift ~~Markdown~~ Library \n
  Swift *Markdown* Library \n
  Swift ~~**Markdown**~~ Library \n
  """.uppercased()

label.attributedText = string.markdown(font: label.font)
```

Or if you already have a `NSAttributedString`, simply add the markdown tags to your string and use the `markdown` property:

```swift
let string = "SWIFT **MARKDOWN** LIBRARY"
let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)]
let attributed = NSAttributedString(string: string, attributes: attributes)
label.attributedText = attributed.markdown
```

## License

SwiftMarkdown is released under an MIT license.
