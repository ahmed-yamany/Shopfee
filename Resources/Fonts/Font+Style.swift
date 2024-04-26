//
//  Font+Style.swift
//
//  Created by Ahmed Yamany on 6/1/2023.
//

import SwiftUI

// swiftlint: disable all
public extension Font {
    static func body(size: CGFloat, weight: Font.Weight) -> Font {
        .custom(size: size, weight: weight)
    }
    
    static func title(size: CGFloat, weight: Font.Weight) -> Font {
        .custom(size: size, weight: weight)
    }
    
    static func heading(size: CGFloat, weight: Font.Weight) -> Font {
        .custom(size: size, weight: weight)
    }
    
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
