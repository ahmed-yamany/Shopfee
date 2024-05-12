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

extension ProductCellModel {
    static var sample = ProductCellModel(
        id: UUID().uuidString,
        name: "Coffee Milk",
        ingredients: "Ice americano + fresh milk",
        price: "Rp25.000",
        discountPrice: "",
        imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
    )
}
