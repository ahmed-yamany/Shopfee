//
//  ProductCustomizeEntity.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 13/05/2024.
//

import Foundation

struct ProductCustomizeEntity: Identifiable {
    var id = UUID()
    
    let title: String
    let pickerItems: [FilterPickerItem]
}
