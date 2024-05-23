//
//  FilterPickerItem.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 09/05/2024.
//

import SwiftUI

struct FilterPickerItem: Identifiable, Equatable {
    let id: String
    var image: Image?
    let title: String
}

extension FilterPickerItem {
    init(model: ProductCustomizeModel) {
        id = model.id?.uuidString ?? UUID().uuidString
        image = Image(uiImage: UIImage(data: model.image ?? Data()) ?? UIImage())
        title = model.title ?? ""
    }
}
