//
//  View+navigationTitle.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func navigationTitle(_ title: String) -> some View {
        toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .font(.custom(size: 16, weight: .medium))
                    .foregroundStyle(.textHeading)
            }
        }
    }
}
