//
//  OTPTextField.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 30/04/2024.
//

import SwiftUI

struct OTPTextField<Content: View>: View {
    @Binding var otp: String
    let otpLength: Int
    var spacing: CGFloat = 0
    @ViewBuilder let content: (String, Int, Bool) -> Content // (pin, index, focused)

    @FocusState private var focusTextField: Bool
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<otpLength, id: \.self) { index in
                content(pin(at: index), index, index < otp.count)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            focusTextField = true
        }
        .background {
            backgroundTextField
            
        }
        .onChange(of: otp) { _ in
            limitOTPToCount()
        }
        
    }
    
    private var backgroundTextField: some View {
        TextField("", text: $otp)
            .frame(width: 0, height: 0, alignment: .center)
            .font(Font.system(size: 0))
            .accentColor(.blue)
            .foregroundColor(.blue)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .focused($focusTextField)
    }
    
    private func pin(at index: Int) -> String {
        guard otp.count > index else {
            return ""
        }
        return String(otp[index])
    }
    
    private func limitOTPToCount() {
        if otp.count > otpLength {
            otp = String(otp.prefix(otpLength))
        }
    }
}

#Preview {
    OTPTextField(otp: .constant("202"), otpLength: 5) { pin, _, focused in
        Text(pin)
            .frame(width: 60, height: 70)
            .background(.neutralMediam)
            .mask(RoundedRectangle(cornerRadius: 16))
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 1)
                    .fill(focused ? .brand : .clear)
            }
    }
}
