//
//  CartEntity.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 15/05/2024.
//

import UIKit

struct CartEntity: Identifiable, Equatable {
    let id: String
    let name: String
    let currency: String
    let price: Double
    let imageUrl: String
    let customize: [FilterPickerItem]
    let extra: [ProductExtraEntity]
    
    var totalPrice: Double {
        price + extra.map { $0.price }.reduce(0, +)
    }
}

extension CartEntity {
    init(product: ProductCellModel, customize: [FilterPickerItem], extra: [ProductExtraEntity]) {
        self.id = product.id
        self.name = product.name
        self.currency = product.currency
        self.price = product.price
        self.imageUrl = product.imageUrl
        self.customize = customize
        self.extra = extra
    }
}
