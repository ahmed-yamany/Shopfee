//
//  OfferSectionUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation

protocol OfferSectionUseCaseProtocol {
    func getOffers() async throws -> [OfferCellModel]
}

final class OfferSectionUseCase: OfferSectionUseCaseProtocol {
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
