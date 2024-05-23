//
//  ProductDetailsUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import Foundation

protocol ProductDetailsUseCaseProtocol {
    func getDetails() async throws -> ProductDetailsEntity
    func addOrder(with customize: [FilterPickerItem], and extra: [ProductExtraEntity], count: Int) async throws
}

final class ProductDetailsUseCase: ProductDetailsUseCaseProtocol {
    let product: ProductCellModel
    let cartUseCase: CartUseCaseProtocol
    
    init(product: ProductCellModel, cartUseCase: CartUseCaseProtocol) {
        self.product = product
        self.cartUseCase = cartUseCase
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
            availableCount: 10,
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
    
    func addOrder(with customize: [FilterPickerItem], and extra: [ProductExtraEntity], count: Int) async throws {
        let cart = await CartEntity(product: product, customize: customize, extra: extra, count: count)
        try await cartUseCase.add(cart)
    }
}
