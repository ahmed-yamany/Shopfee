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
    let price: Double
    let currency: String
    let ingredients: String
    let availableCount: Int
    let rating: String
    let ratingCount: Int
    let customize: [ProductCustomizeEntity]
    let extras: [ProductExtraEntity]
}
