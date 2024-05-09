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
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
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
                                selectedItems.append(item)
                            }
                        }
                }
            }
            .font(.custom(size: 12, weight: .medium))
            .padding(.horizontal, .safeAreaPadding)
        }
    }
}
