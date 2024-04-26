//
//  CirclePaginationStyle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct CirclePaginationStyle: PaginationStyle {
    @Environment(\.paginationTint) private var tint: Color
    @Environment(\.paginationSelectTint) private var selectedTint: Color
    
    func makeBody(configurations: Configurations) -> some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(configurations.currentIndex.hashValue == configurations.selectedIndex.hashValue ? selectedTint : tint)
            .frame(width: 10, height: 10)
    }
}

extension PaginationStyle where Self == CirclePaginationStyle {
    static var circle: Self {
        CirclePaginationStyle()
    }
}
