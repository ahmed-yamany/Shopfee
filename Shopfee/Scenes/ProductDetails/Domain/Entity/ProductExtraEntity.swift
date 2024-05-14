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
