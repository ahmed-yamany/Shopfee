//
//  Cart.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 16/05/2024.
//

import UIKit

struct CartEntity: Identifiable, Equatable {
    
    let id: String
    let name: String
    let ingredients: String
    let currency: String
    let price: Double
    var count: Int
    let imageUrl: String
    let customize: [FilterPickerItem]
    let extra: [ProductExtraEntity]
    let image: UIImage
    
    var totalPrice: Double {
        (price + extra.map { $0.price }.reduce(0, +) + extra.map { $0.price }.reduce(0, +)) * Double(count)
    }
    
    mutating func updateCount(_ count: Int) {
        self.count = count
    }
}

@MainActor
extension CartEntity {
    init(product: ProductCellModel, customize: [FilterPickerItem], extra: [ProductExtraEntity], count: Int) {
        self.id = product.id
        self.name = product.name
        self.ingredients = product.ingredients
        self.currency = product.currency
        self.price = product.price
        self.imageUrl = product.imageUrl
        self.customize = customize
        self.extra = extra
        self.image = product.image
        self.count = count
    }
}

extension CartEntity {
    init(cartModel: CartModel, customize: [ProductCustomizeModel], extra: [ProductExtraModel]) {
        self.id = cartModel.id?.uuidString ?? UUID().uuidString
        self.name = cartModel.name ?? ""
        self.ingredients = cartModel.ingredients ?? ""
        self.currency = cartModel.currency ?? ""
        self.price = cartModel.price
        self.imageUrl = cartModel.imageUrl ?? ""
        self.customize = customize.map { FilterPickerItem(model: $0) }
        self.extra = extra.map { ProductExtraEntity(model: $0) }
        self.image = UIImage(data: cartModel.image ?? Data()) ?? UIImage()
        self.count = Int(cartModel.count)
    }
}
