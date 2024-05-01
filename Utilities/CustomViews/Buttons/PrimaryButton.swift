//
//  PrimaryButton.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI
import SwiftUIModifiers

enum ShopfeeButtonSize {
    case normal
    case small
}

protocol ShopfeeButtonStyle {
    var foregroundColor: Color { get }
    var background: Color { get }
    var borderColor: Color { get }
    var height: CGFloat? { get }
}

struct PrimaryPrimaryButtonStyle: ShopfeeButtonStyle {
    let size: ShopfeeButtonSize
    let foregroundColor: Color = .neutralLight
    let background: Color = .brand
    let borderColor: Color = .clear
    var height: CGFloat? {
        switch size {
            case .normal:
                return 48
            case .small:
                return 36
        }
    }
}

struct SecondaryPrimaryButtonStyle: ShopfeeButtonStyle {
    let size: ShopfeeButtonSize
    let foregroundColor: Color = .textHeading
    let background: Color = .neutralLight
    let borderColor: Color = .brand
    var height: CGFloat? {
        switch size {
            case .normal:
                return 48
            case .small:
                return 36
        }
    }
}

struct GhostPrimaryButtonStyle: ShopfeeButtonStyle {
    let foregroundColor: Color = .textHeading
    let background: Color = .clear
    let borderColor: Color = .clear
    let height: CGFloat? = nil
}

struct InfoPrimaryButtonStyle: ShopfeeButtonStyle {
    let foregroundColor: Color = .info
    let background: Color = .clear
    let borderColor: Color = .clear
    let height: CGFloat? = nil
}

struct PrimaryButton<Style: ShopfeeButtonStyle>: ButtonStyle {
    let style: Style
    
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(foregroundColor(configuration))
            .frame(height: style.height)
            .font(.custom(size: 14, weight: .medium))
            .onCondition(style.height != nil) {
                $0
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor(configuration))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 1)
                            .fill(style.borderColor)
                    }
            }
    }
    
    func backgroundColor(_ configuration: Configuration) -> Color {
        if configuration.isPressed {
            return Color.textDisabled
        }
        
        if !isEnabled {
            return Color.textDisabled
        }
        
        return style.background
    }
    
    func foregroundColor(_ configuration: Configuration) -> Color {
        if configuration.isPressed {
            return Color.textNonActive
        }
        
        if !isEnabled {
            return style.foregroundColor
        }
        
        return style.foregroundColor
    }
}

extension ButtonStyle where Self == PrimaryButton<PrimaryPrimaryButtonStyle> {
    static func primary(size: ShopfeeButtonSize = .normal) -> Self {
        PrimaryButton(style: PrimaryPrimaryButtonStyle(size: size))
    }
}

extension ButtonStyle where Self == PrimaryButton<SecondaryPrimaryButtonStyle> {
    static func secondary(size: ShopfeeButtonSize = .normal) -> Self {
        PrimaryButton(style: SecondaryPrimaryButtonStyle(size: size))
    }
}

extension ButtonStyle where Self == PrimaryButton<GhostPrimaryButtonStyle> {
    static var ghost: Self {
        PrimaryButton(style: GhostPrimaryButtonStyle())
    }
}

extension ButtonStyle where Self == PrimaryButton<InfoPrimaryButtonStyle> {
    static var info: Self {
        PrimaryButton(style: InfoPrimaryButtonStyle())
    }
}
