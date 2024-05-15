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
    
    // swiftlint: disable all
    func getDetails() async throws -> ProductDetailsEntity {
        ProductDetailsEntity(
            id: UUID().uuidString,
            type: "Coffee",
            name: "Coffee milk",
            price: 25.000,
            currency: "RP",
            ingredients: "Ice americano + fresh milk ",
            rating: "4.9",
            ratingCount: 23,
            customize: [
                .init(
                    title: "Variant",
                    pickerItems: [
                        .init(id: UUID().uuidString, title: "Ice"),
                        .init(id: UUID().uuidString, title: "Hot")
                    ]
                ),
                .init(
                    title: "Size",
                    pickerItems: [
                        .init(id: UUID().uuidString, title: "Regular"),
                        .init(id: UUID().uuidString, title: "Medium"),
                        .init(id: UUID().uuidString, title: "Large")
                    ]
                ),
                .init(
                    title: "Sugar",
                    pickerItems: [
                        .init(id: UUID().uuidString, title: "Normal"),
                        .init(id: UUID().uuidString, title: "Less")
                    ]
                ),
                .init(
                    title: "Ice",
                    pickerItems: [
                        .init(id: UUID().uuidString, title: "Normal"),
                        .init(id: UUID().uuidString, title: "Less")
                    ]
                )
            ],
            extras: [
                .init(
                    id: UUID().uuidString,
                    title: "Extra Espresso",
                    price: 5.00,
                    currency: "RP"
                ),
                .init(
                    id: UUID().uuidString,
                    title: "Cincau",
                    price: 6.00,
                    currency: "RP"
                ),
                .init(
                    id: UUID().uuidString,
                    title: "Coffe Jelly",
                    price: 3.00,
                    currency: "RP"
                ),
                .init(
                    id: UUID().uuidString,
                    title: "Chocolate Ice Creame",
                    price: 7.00,
                    currency: "RP"
                )
            ]
        )
    }
    // swiftlint: enable all
}
