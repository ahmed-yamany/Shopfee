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
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Caramel Latte",
                ingredients: "Espresso, Fresh Milk and Caramel",
                price: 25.000,
                discountPrice: 28.000,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1t0wfXoRCPqJIBrnHyZ2Puk9li93M3yIG"
            ),
            .init(
                id: UUID().uuidString,
                name: "Flat White",
                ingredients: "Smooth ristretto shots of espresso with milk",
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1HCeLk1GUNIxFzL8G_e4dj6YacV3APtDm"
            ),
            .init(
                id: UUID().uuidString,
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1gFLUziksmbmXWaIDYLSkVRTqqrTrW_e9"
            ),
            .init(
                id: UUID().uuidString,
                name: "Caramel Latte",
                ingredients: "Espresso, Fresh Milk and Caramel",
                price: 25.000,
                discountPrice: 28.000,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1T1ObpE2t_q0nArkVKKe20kGVXq7XSwCR"
            ),
            .init(
                id: UUID().uuidString,
                name: "Flat White",
                ingredients: "Smooth ristretto shots of espresso with milk",
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1DPQjrJdkMlt343kdO6yB1j8llU1v2N1q"
            ),
            .init(
                id: UUID().uuidString,
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1cmknawqg54_dk-mVVnQYvT3CI5zNpnOu"
            ),
            .init(
                id: UUID().uuidString,
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1d3mHmFdXSZuaDysomix4p6YF3PivqJ0M"
            ),
            .init(
                id: UUID().uuidString,
                name: "Caramel Latte",
                ingredients: "Espresso, Fresh Milk and Caramel",
                price: 25.000,
                discountPrice: 28.000,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1t0wfXoRCPqJIBrnHyZ2Puk9li93M3yIG"
            ),
            .init(
                id: UUID().uuidString,
                name: "Flat White",
                ingredients: "Smooth ristretto shots of espresso with milk",
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1HCeLk1GUNIxFzL8G_e4dj6YacV3APtDm"
            ),
            .init(
                id: UUID().uuidString,
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1gFLUziksmbmXWaIDYLSkVRTqqrTrW_e9"
            ),
            .init(
                id: UUID().uuidString,
                name: "Caramel Latte",
                ingredients: "Espresso, Fresh Milk and Caramel",
                price: 25.000,
                discountPrice: 28.000,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1T1ObpE2t_q0nArkVKKe20kGVXq7XSwCR"
            ),
            .init(
                id: UUID().uuidString,
                name: "Flat White",
                ingredients: "Smooth ristretto shots of espresso with milk",
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1DPQjrJdkMlt343kdO6yB1j8llU1v2N1q"
            ),
            .init(
                id: UUID().uuidString,
                name: "Coffee Milk",
                ingredients: "Ice americano + fresh milk",
                price: 25.000,
                discountPrice: 0.0,
                currency: "RP",
                imageUrl: "https://drive.google.com/uc?export=view&id=1cmknawqg54_dk-mVVnQYvT3CI5zNpnOu"
            ),
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
