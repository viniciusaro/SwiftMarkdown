import Quick
import Nimble
import Nimble_Snapshots
import UIKit
@testable import SwiftMarkdown

class SwiftMarkdownTests: QuickSpec {
    override func spec() {
        describe("should render correctly") {
            var label: UILabel!
            beforeEach {
                label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 200)))
                label.backgroundColor = .white
                label.textAlignment = .center
            }
            it("with no formatting") {
                label.attributedText = "Swift Markdown Library".buttonCaption.markdown
                expect(label).to(haveValidSnapshot())
            }
            it("with bold string") {
                label.attributedText = "Swift **Markdown** Library".buttonCaption.markdown
                expect(label).to(haveValidSnapshot())
            }
            it("with italic string") {
                label.attributedText = "Swift *Markdown* Library".buttonCaption.markdown
                expect(label).to(haveValidSnapshot())
            }
            it("with strikethrough string") {
                label.attributedText = "Swift ~~Markdown~~ Library".buttonCaption.markdown
                expect(label).to(haveValidSnapshot())
            }
            it("with italic strikethrough string") {
                label.attributedText = "Swift *~~Markdown~~* Library".buttonCaption.markdown
                expect(label).to(haveValidSnapshot())
            }
            it("with italic strikethrough (inverse) string") {
                label.attributedText = "Swift ~~*Markdown*~~ Library".buttonCaption.markdown
                expect(label).to(haveValidSnapshot())
            }
            it("with wrong bold formatting") {
                label.attributedText = "Swift **Markdown* Library".buttonCaption.markdown
                expect(label).to(haveValidSnapshot())
            }
            it("with asterisks as string") {
                label.attributedText = "Swift Markdown* Library".buttonCaption.markdown
                expect(label).to(haveValidSnapshot())
            }
            it("with multiple matches") {
                label.attributedText = "**Swift** Markdown **Library**".buttonCaption.markdown
                expect(label).to(haveValidSnapshot())
            }
        }
    }
}
