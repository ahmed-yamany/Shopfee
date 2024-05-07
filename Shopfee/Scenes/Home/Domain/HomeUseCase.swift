//
//  HomeUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import UIKit
import Domain

protocol HomeUseCaseProtocol: AnyActor {
    func getOffers() async throws -> [OfferCellModel]
    func getProducts() async throws -> [ProductCellModel]
    func fetchImage(from urlString: String) async throws -> UIImage
}

final actor HomeUseCase: HomeUseCaseProtocol {
    let imageUseCase: ImageUseCaseProtocol
    
    init(imageUseCase: ImageUseCaseProtocol) {
        self.imageUseCase = imageUseCase
    }
    
    func fetchImage(from urlString: String) async throws -> UIImage {
        try await imageUseCase.fetchImage(from: urlString)
    }
    
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
        await [
            .init(
                id: UUID().uuidString,
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Caramel Latte",
                ingredients: "Espresso, Fresh Milk and Caramel",
                price: "Rp25.000",
                discountPrice: "Rp28.000",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Flat White",
                ingredients: "Smooth ristretto shots of espresso with milk",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Machiato",
                ingredients: "Espresso and cream machiato",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Caramel Latte",
                ingredients: "Espresso, Fresh Milk and Caramel",
                price: "Rp25.000",
                discountPrice: "Rp28.000",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Flat White",
                ingredients: "Smooth ristretto shots of espresso with milk",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Machiato",
                ingredients: "Espresso and cream machiato",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Caramel Latte",
                ingredients: "Espresso, Fresh Milk and Caramel",
                price: "Rp25.000",
                discountPrice: "Rp28.000",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Flat White",
                ingredients: "Smooth ristretto shots of espresso with milk",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Machiato",
                ingredients: "Espresso and cream machiato",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Caramel Latte",
                ingredients: "Espresso, Fresh Milk and Caramel",
                price: "Rp25.000",
                discountPrice: "Rp28.000",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Flat White",
                ingredients: "Smooth ristretto shots of espresso with milk",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Machiato",
                ingredients: "Espresso and cream machiato",
                price: "Rp25.000",
                discountPrice: "",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            )
        ]
    }
  
}
