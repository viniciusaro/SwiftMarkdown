# SwiftMarkdown

SwiftMarkdown is library for parsing and formatting strings with markdown tags

![Travis](https://travis-ci.org/viniciusaro/SwiftMarkdown.svg?branch=master)

![Bare String With Multiple Formatting](https://github.com/viniciusaro/SwiftMarkdown/blob/master/SwiftMarkdown/SwiftMarkdownTests/ReferenceImages/SwiftMarkdownTests/should_render_correctly__with_multiple_lines_text@3x.png)

## Usage

To have your label formatted like the above your code would look like the following:

```swift
let string = """
  Swift **Markdown** Library
  Swift ~~Markdown~~ Library
  Swift *Markdown* Library
  Swift ~~**Markdown**~~ Library
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

## Installation

### Cocoapods

```
pod 'SwiftMarkdown'
```

### Swift Package Manager

Add the following as a dependency to your Package.swift:

```swift
.package(url: "https://github.com/viniciusaro/SwiftMarkdown.git", .upToNextMajor(from: "0.0.2"))
```

You also need to specify "SwiftMarkdown" as a dependency of the Target in which you wish to use SwiftMarkdown.

```swift
...
targets: [
  .target(
    name: "MyApp",
    dependencies: ["SwiftResolver", "SwiftMarkdown"]),
...
```
## Features

### Emphasis
```
*Italic*
**Bold**
~~Strikethrough~~
```

### Headers
```
# H1
## H2
### H3
#### H4
##### H5
###### H6
```

## License

SwiftMarkdown is released under an MIT license.
