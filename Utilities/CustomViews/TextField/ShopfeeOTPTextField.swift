//
//  ShopfeeOTPTextField.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 30/04/2024.
//

import SwiftUI
import SwiftUIViews

struct ShopfeeOTPTextField: View {
    @Binding var otp: String
    let otpLength: Int
    
    var body: some View {
        OTPTextField(otp: $otp, otpLength: otpLength, spacing: 8) { pin, _, focused in
            Text(pin)
                .foregroundStyle(.textHeading)
                .font(.custom(size: 32, weight: .medium))
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(.neutralMediam)
                .mask(RoundedRectangle(cornerRadius: 12))
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .fill(focused ? .brand : .clear)
                        .shadow(color: focused ? .brand : .clear, radius: 2)
                }
        }
        .keyboardType(.numberPad)
    }
}

#Preview {
    ShopfeeOTPTextField(otp: .constant("123"), otpLength: 5)
}
