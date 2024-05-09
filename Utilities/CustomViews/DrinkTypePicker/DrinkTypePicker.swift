//
//  DrinkTypePicker.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 09/05/2024.
//

import SwiftUI

struct DrinkTypePicker: View {
    let items: [String]
    @Binding var selectedItem: String
    
    @Namespace private var animation
    
    var body: some View {
        HStack {
            ForEach(items, id: \.self) { item in
                let isSelected = item == selectedItem
                
                itemView(item)
                    .padding(.bottom, 12)
                    .overlay(alignment: .bottom) {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.brand)
                                .frame(height: 2)
                                .matchedGeometryEffect(id: "Bottom", in: animation)
                        }
                    }
            }
        }
        .animation(.bouncy, value: selectedItem)
        .padding(.horizontal, .safeAreaPadding)
    }
    
    @ViewBuilder
    func itemView(_ item: String) -> some View {
        let isSelected = item == selectedItem
        Text(item)
            .frame(maxWidth: .infinity)
            .foregroundStyle(isSelected ? .brand : .textDisabled)
            .font(.custom(size: 16, weight: .medium))
            .onTapGesture {
                selectedItem = item
            }
    }
}
