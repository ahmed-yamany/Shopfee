//
//  ProductExtraEntity.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 14/05/2024.
//

import Foundation

struct ProductExtraEntity: Identifiable, Equatable {
    let id: String
    let title: String
    let price: Double
    let currency: String
    
    var priceString: String {
        "+ \(currency). \(price)"
    }
}

extension ProductExtraEntity {
    init(model: ProductExtraModel) {
        id = model.id?.uuidString ?? UUID().uuidString
        title = model.title ?? ""
        price = model.price
        currency = model.currency ?? ""
    }
}
