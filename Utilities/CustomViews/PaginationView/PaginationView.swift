//
//  PaginationView.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct PaginationView: View {
    let count: Int
    let selectedIndex: Int
    
    @Environment(\.paginationStyle) private var style
    
    var body: some View {
        HStack {
            ForEach(0..<count, id: \.self) { index in
                AnyView(style.resolve(configurations: .init(currentIndex: index, selectedIndex: selectedIndex)))
            }
        }
        .animation(.spring, value: selectedIndex)
    }
}
