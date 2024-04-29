//
//  View+PrimaryStyle.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI

struct PrimaryStyle: ViewModifier {
    let alignment: Alignment
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .background(Color.neutralLight)
            .tint(Color.brand)
            .foregroundStyle(.textHeading)
            .onTapGesture {
                hideKeyboard()
            }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

extension View {
    @ViewBuilder
    func applyPrimaryStyle(alignment: Alignment = .center) -> some View {
        modifier(PrimaryStyle(alignment: alignment))
        
    }
}
