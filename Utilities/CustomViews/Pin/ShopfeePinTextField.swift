//
//  ShopfeePinTextField.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import SwiftUI

struct ShopfeePinTextField: View {
    @Binding var pin: String
    let pinLength: Int
    let showPin: Bool
    
    var  width: CGFloat {
        showPin ? 40 : 30
    }
    
    var body: some View {
        OTPTextField(otp: $pin, otpLength: pinLength, spacing: 8) { pin, _, focused in
            shape(focused: focused)
                .fill(fillColor(focused: focused))
                .frame(width: width, height: width)
                .background {
                    shape(focused: focused)
                        .stroke(lineWidth: 1)
                        .fill(Color.textNonActive)
                        .shadow(color: shadowColor(), radius: 3)
                }
                .overlay {
                    if showPin {
                        Text(pin)
                            .foregroundStyle(.textHeading)
                            .font(.custom(size: 16, weight: .medium))
                    }
                }
                .frame(maxHeight: 42)
        }
        .keyboardType(.numberPad)
    }
    
    private func shape(focused: Bool) -> some Shape {
        RoundedRectangle(cornerRadius: showPin ? 6 : width / 2)
    }
    
    private func fillColor(focused: Bool) -> Color {
        if showPin {
            return .neutralLight
        }
        
        return focused ? .textHeading : .neutralLight
    }
    
    private func shadowColor() -> Color {
        if showPin {
            return .textHeading
        }
        
        return .clear
    }
}

#Preview {
    ShopfeePinTextField(pin: .constant("123"), pinLength: 6, showPin: false)
}
