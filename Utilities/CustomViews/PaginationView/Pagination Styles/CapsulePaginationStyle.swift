//
//  CapsulePaginationStyle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct CapsulePaginationStyle: PaginationStyle {
    @Environment(\.paginationTint) private var tint: Color
    @Environment(\.paginationSelectTint) private var selectedTint: Color
    
    func makeBody(configurations: Configurations) -> some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(configurations.currentIndex == configurations.selectedIndex ? selectedTint : tint)
            .frame(width: configurations.currentIndex == configurations.selectedIndex ? 30 : 10, height: 10)
            .animation(.spring, value: configurations.selectedIndex)
    }
}

extension PaginationStyle where Self == CapsulePaginationStyle {
    static var capsule: Self {
        CapsulePaginationStyle()
    }
}
