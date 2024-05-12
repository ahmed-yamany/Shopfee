//
//  ProductDetailsViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI

@MainActor
protocol ProductDetailsViewModelProtocol: ObservableObject {
    func viewWillAppear()
}

@MainActor
final class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    
    private let coordinator: ProductDetailsCoordinatorProtocol
    private let useCase: ProductDetailsUseCaseProtocol
    
    init(coordinator: ProductDetailsCoordinatorProtocol, useCase: ProductDetailsUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func viewWillAppear() {
        coordinator.viewWillAppear()
    }
}
