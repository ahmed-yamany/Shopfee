//
//  OfferSectionFactory.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation

struct OfferSectionFactory {
    @MainActor
    static func make() -> OfferCollectionViewSection {
        let useCase = OfferSectionUseCase()
        let viewModel = OfferSectionViewModel(useCase: useCase)
        return OfferCollectionViewSection(viewModel: viewModel)
    }
}
