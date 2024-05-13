//
//  FilterPicker.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 09/05/2024.
//

import SwiftUI

struct FilterPicker: View {
    let items: [FilterPickerItem]
    @Binding var selectedItems: [FilterPickerItem]
    var multiSelect: Bool = true
    
    var body: some View {
        if multiSelect {
            ScrollView(.horizontal, showsIndicators: false) {
                content
                    .padding(.horizontal, .safeAreaPadding)
            }
        } else {
            content
        }
    }
    
    private var content: some View {
        HStack {
            ForEach(items) { item in
                let exists = selectedItems.contains(where: { $0 == item })
                Label(title: { Text(item.title) }, icon: { item.image })
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(exists ? .brand : .brand50)
                    .mask(RoundedRectangle(cornerRadius: 12))
                    .foregroundStyle(exists ? .neutralLight : .textHeading)
                    .onTapGesture {
                        if exists {
                            selectedItems = selectedItems.filter { $0 != item }
                        } else {
                            if !multiSelect { selectedItems.removeAll(where: {items.contains($0)}) }
                            selectedItems.append(item)
                        }
                    }
            }
        }
        .font(.custom(size: 12, weight: .medium))
    }
}
