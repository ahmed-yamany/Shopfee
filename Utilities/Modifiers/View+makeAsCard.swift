//
//  View+makeAsCard.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 13/05/2024.
//

import SwiftUI

extension View {
    @ViewBuilder
    func makeAsCard() -> some View {
        foregroundStyle(.textHeading)
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(.neutralLight)
        .mask(RoundedRectangle(cornerRadius: 8))
        .shadow(color: .textHeading.opacity(0.3), radius: 3)
    }
}
