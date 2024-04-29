//
//  ShopfeeTextField.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 28/04/2024.
//

import SwiftUI
import SwiftUIModifiers

struct ShopfeeTextFieldShowErrorEnvironmentKey: EnvironmentKey {
    static var defaultValue: (show: Bool, message: String) = (false, "")
}

extension EnvironmentValues {
    var shopfeeTextFieldShowError: (show: Bool, message: String) {
        get { self[ShopfeeTextFieldShowErrorEnvironmentKey.self] }
        set { self[ShopfeeTextFieldShowErrorEnvironmentKey.self] = newValue }
    }
}

extension View {
    @ViewBuilder
    func showShopfeeTextFieldError(_ show: Bool, message: String) -> some View {
        environment(\.shopfeeTextFieldShowError, (show, message))
    }
}

struct ShopfeeTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    @State private var isFocused: Bool = false
    @Environment(\.shopfeeTextFieldShowError) private var showShopfeeTextFieldError: (show: Bool, message: String)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.textHeading)
            
            VStack(alignment: .leading, spacing: 4) {
                textField
                
                if showShopfeeTextFieldError.show {
                    errorText
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.custom(size: 12, weight: .regular))
        .animation(.default, value: isFocused)
    }
    
    var textField: some View {
        TextField(
            "",
            text: $text,
            onEditingChanged: { editing in
                isFocused = editing
            }
        )
        .foregroundStyle(.textHeading)
        .background {
            if showPrompt { prompt }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 16))
        .background {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1.5)
                .fill(borderColor)
        }
        .shadow(color: shadowColor, radius: 3)
    }
    
    var prompt: some View {
        Text(placeholder)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.custom(size: 14, weight: .regular))
            .foregroundColor(.textDisabled)
    }
    
    var errorText: some View {
        Text(showShopfeeTextFieldError.message)
            .foregroundStyle(.danger)
            .font(.custom(size: 10, weight: .regular))
    }
    
    var showPrompt: Bool {
        text.isEmpty
    }
    
    var borderColor: Color {
        if showShopfeeTextFieldError.show {
            .danger
        } else if isFocused {
            .brand
        } else {
            .brand100
        }
    }
    
    var shadowColor: Color {
        if showShopfeeTextFieldError.show {
            .danger
        } else if isFocused {
            .brand
        } else {
            .clear
        }
    }
}

#Preview {
    ShopfeeTextField(
        title: "Name",
        placeholder: "input your name",
        text: .constant("")
    )
    .padding()
}
