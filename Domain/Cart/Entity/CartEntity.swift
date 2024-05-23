//
//  Cart.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 16/05/2024.
//

import Foundation

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

extension CartEntity {
    init(cartModel: CartModel, customize: [ProductCustomizeModel], extra: [ProductExtraModel]) {
        self.id = cartModel.id?.uuidString ?? UUID().uuidString
        self.name = cartModel.name ?? ""
        self.currency = cartModel.currency ?? ""
        self.price = cartModel.price
        self.imageUrl = cartModel.imageUrl ?? ""
        self.customize = customize.map { FilterPickerItem(model: $0) }
        self.extra = extra.map { ProductExtraEntity(model: $0) }
    }
}
