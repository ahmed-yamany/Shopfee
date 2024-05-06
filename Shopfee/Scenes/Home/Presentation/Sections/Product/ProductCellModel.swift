//
//  ProductCellModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 06/05/2024.
//

import SwiftUI

class ProductCellModel: Identifiable, ObservableObject {
    var id = UUID()
    
    let name: String
    let ingredients: String
    let price: String
    let discountPrice: String
    @Published var image: UIImage
    
    init(name: String, ingredients: String, price: String, discountPrice: String, image: UIImage = UIImage()) {
        self.name = name
        self.ingredients = ingredients
        self.price = price
        self.discountPrice = discountPrice
        self.image = image
    }
    
    func updateImage(_ image: UIImage) {
        self.image = image
    }
}
