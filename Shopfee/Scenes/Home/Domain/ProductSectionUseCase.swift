//
//  ProductSectionUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import UIKit
import Domain
import SwiftUI

protocol ProductSectionUseCaseProtocol: AnyActor {
    func fetchImage(from urlString: String) async throws -> UIImage
    func getProducts() async throws -> [ProductCellModel]
    func getDrinkTypes() async throws -> [String]
    func getFilterPickerItems() async throws -> [FilterPickerItem]
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
  
    func getDrinkTypes() async throws -> [String] {
        ["Coffee", "Non Coffee", "Pastry"]
    }
    
    func getFilterPickerItems() async throws -> [FilterPickerItem] {
        [
            .init(
                id: UUID().uuidString,
                image: Image(systemName: "line.3.horizontal.decrease.circle"),
                title: "Filter"
            ),
            .init(
                id: UUID().uuidString,
                image: Image(systemName: "star"),
                title: "Rating 4.5+"
            ),
            .init(
                id: UUID().uuidString,
                image: Image(systemName: "dollarsign"),
                title: "Price"
            ),
            .init(
                id: UUID().uuidString,
                image: Image(systemName: "percent"),
                title: "Promo"
            )
        ]
    }
}
