//
//  ProductSectionUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import UIKit
import Domain

protocol ProductSectionUseCaseProtocol: AnyActor {
    func fetchImage(from urlString: String) async throws -> UIImage
    func getProducts() async throws -> [ProductCellModel]
}

final actor ProductSectionUseCase: ProductSectionUseCaseProtocol {
    let imageUseCase: ImageUseCaseProtocol
    
    init(imageUseCase: ImageUseCaseProtocol) {
        self.imageUseCase = imageUseCase
    }
    
    func fetchImage(from urlString: String) async throws -> UIImage {
        try await imageUseCase.fetchImage(from: urlString)
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
        // swiftlint: enable all
    }
  
}
