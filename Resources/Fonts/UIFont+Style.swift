import UIKit

// swiftlint: disable all
public extension UIFont {
    
    static func body(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        .custom(size: size, weight: weight)
    }
    
    static func title(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        .custom(size: size, weight: weight)
    }
    
    static func heading(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        .custom(size: size, weight: weight)
    }
    
    
    /// Returns a custom font with the specified size and weight.
    ///
    /// - Parameters:
    ///   - size: The size of the font in points.
    ///   - weight: The weight of the font.
    /// - Returns: A custom font with the given size and weight.
    static func custom(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontName = self.fontName(forWeight: weight)
        // Attempt to create a font with the specified name and size
        guard let font = UIFont(name: fontName, size: size) else {
            assertionFailure("Unable to get a font with name: \(fontName)")
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
        return font
    }
   
    static private func fontName(forWeight weight: UIFont.Weight) -> String {
        switch weight {
            case .regular: return "Poppins-Regular"
            case .medium: return "Poppins-Medium"
            case .bold: return "Poppins-Bold"
            default: return "Poppins-Regular"
        }
    }
}
// swiftlint: enable all
