//
//  ProductSectionFactory.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation
import Domain

struct ProductSectionFactory {
    @MainActor 
    static func make() -> ProductCollectionViewSection {
        let imageUseCase = ImageUseCase()
        let useCase = ProductSectionUseCase(imageUseCase: imageUseCase)
        let viewModel = ProductSectionViewModel(useCase: useCase)
        return ProductCollectionViewSection(viewModel: viewModel)
    }
}
