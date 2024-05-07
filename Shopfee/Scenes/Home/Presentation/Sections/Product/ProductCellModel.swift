//
//  ProductCellModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 06/05/2024.
//

import SwiftUI

/// This model is like a ViewModel for the product's cell
@MainActor
class ProductCellModel: Identifiable, ObservableObject {
    let id: String
    let name: String
    let ingredients: String
    let price: String
    let discountPrice: String
    let imageUrl: String
    
    @Published var image: UIImage
    
    init(
        id: String,
        name: String,
        ingredients: String,
        price: String,
        discountPrice: String,
        imageUrl: String,
        image: UIImage = UIImage()
    ) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.price = price
        self.discountPrice = discountPrice
        self.imageUrl = imageUrl
        self.image = image
    }
    
    func updateImage(_ image: UIImage) {
        self.image = image
    }
}
