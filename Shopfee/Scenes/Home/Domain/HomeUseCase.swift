//
//  HomeUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import UIKit

protocol HomeUseCaseProtocol: AnyActor {
    func getOffers() async throws -> [OfferCellModel]
    func getProducts() async throws -> [ProductCellModel]
}

final actor HomeUseCase: HomeUseCaseProtocol {
    func getOffers() throws -> [OfferCellModel] {
        [
            .init(
                background1: .brand100,
                background2: .neutralMediam,
                title: "Special Offer",
                discount: "Discount 10%",
                discountFor: "All Beverage",
                discountType: "*No minimum purchase"
            ),
            .init(
                background1: .brand100,
                background2: .neutralMediam,
                title: "Special Offer",
                discount: "Discount 10%",
                discountFor: "All Beverage",
                discountType: "*No minimum purchase"
            ),
            .init(
                background1: .brand100,
                background2: .neutralMediam,
                title: "Special Offer",
                discount: "Discount 10%",
                discountFor: "All Beverage",
                discountType: "*No minimum purchase"
            ),
            .init(
                background1: .brand100,
                background2: .neutralMediam,
                title: "Special Offer",
                discount: "Discount 10%",
                discountFor: "All Beverage",
                discountType: "*No minimum purchase"
            )
        ]
    }
    // swiftlint: disable all
    func getProducts() async throws -> [ProductCellModel] {
        [
            .init(
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: "Rp25.000",
                discountPrice: "",
                image: UIImage(named: "product")!
            ),
            .init(
                name: "Caramel Latte",
                ingredients: "Espresso, Fresh Milk and Caramel",
                price: "Rp25.000",
                discountPrice: "Rp28.000",
                image: UIImage(named: "product")!
            ),
            .init(
                name: "Flat White",
                ingredients: "Smooth ristretto shots of espresso with milk",
                price: "Rp25.000",
                discountPrice: "",
                image: UIImage(named: "product")!
            ),
            .init(
                name: "Machiato",
                ingredients: "Espresso and cream machiato",
                price: "Rp25.000",
                discountPrice: "",
                image: UIImage(named: "product")!
            )
        ]
    }
}
