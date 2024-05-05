//
//  HomeUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import Foundation

protocol HomeUseCaseProtocol: AnyActor {
    func getOffers() async throws -> [OfferCellModel]
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
}
