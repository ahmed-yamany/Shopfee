//
//  ProductDetailsEntity.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 13/05/2024.
//

import Foundation

struct ProductDetailsEntity: Identifiable {
    let id: String
    let type: String
    let name: String
    let price: String
    let ingredients: String
    let rating: String
    let ratingCount: String
    let customize: [ProductCustomizeEntity]
}
