import UIKit

extension UIColor {
    static var buttonCaption: UIColor {
        return UIColor.gray
    }
}

extension String {
    var buttonCaption: NSAttributedString {
        return NSAttributedString(string: self.uppercased(), attributes: [NSAttributedStringKey.font: UIFont.buttonCaption,
                                                                          NSAttributedStringKey.foregroundColor: UIColor.buttonCaption])
    }
}

extension UIFont {
    static var buttonCaption: UIFont {
        return .systemFont(ofSize: 20, weight: UIFont.Weight.light)
    }
}
