//
//  ShopfeeTextField.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 28/04/2024.
//

import SwiftUI
import SwiftUIModifiers

struct ShopfeeTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    @State private var isFocused: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.textHeading)
            
            textField
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
            if showPrompt {
                prompt
            }
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
        .shadow(color: isFocused ? .brand : .clear, radius: 3)
    }
    
    var prompt: some View {
        Text(placeholder)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.custom(size: 14, weight: .regular))
            .foregroundColor(.textDisabled)
    }
    
    var showPrompt: Bool {
        text.isEmpty
    }
    
    var borderColor: Color {
        if isFocused {
            return .brand
        }
        
        return .brand100
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
