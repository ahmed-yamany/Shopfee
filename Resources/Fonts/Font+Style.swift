import SwiftUI

// swiftlint: disable all
public extension Font {
    static func custom(size: CGFloat, weight: Font.Weight) -> Font {
        let fontName = self.fontName(forWeight: weight)
        return Font.custom(fontName, size: size)
    }
    
    static private func fontName(forWeight weight: Font.Weight) -> String {
        switch weight {
            case .regular: return "Poppins-Regular"
            case .medium: return "Poppins-Medium"
            case .bold: return "Poppins-Bold"
            default: return "Poppins-Regular"
        }
    }
}
// swiftlint: enable all
