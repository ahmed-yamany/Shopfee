//
//  ProductDetailsUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import Foundation

protocol ProductDetailsUseCaseProtocol {
    func getDetails() async throws -> ProductDetailsEntity
}

final class ProductDetailsUseCase: ProductDetailsUseCaseProtocol {
    let product: ProductCellModel
    
    init(product: ProductCellModel) {
        self.product = product
    }
    
    func getDetails() async throws -> ProductDetailsEntity {
        ProductDetailsEntity(
            id: UUID().uuidString,
            type: "Coffee",
            name: "Coffee milk",
            price: "Rp25.000",
            ingredients: "Ice americano + fresh milk ",
            rating: "4.9",
            ratingCount: "23"
        )
    }
}
