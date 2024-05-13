//
//  ProductDetailsViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI

@MainActor
protocol ProductDetailsViewModelProtocol: ObservableObject {
    var entity: ProductDetailsEntity? { get set }
    var customizeItems: [FilterPickerItem] { get set }
    func viewWillAppear()
    func ratingAndReviewsTapped()
}

@MainActor
final class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    @Published var entity: ProductDetailsEntity?
    @Published var customizeItems: [FilterPickerItem] = []
    
    private let coordinator: ProductDetailsCoordinatorProtocol
    private let useCase: ProductDetailsUseCaseProtocol
    
    init(coordinator: ProductDetailsCoordinatorProtocol, useCase: ProductDetailsUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func viewWillAppear() {
        coordinator.viewWillAppear()
        getDetails()
    }
    
    func ratingAndReviewsTapped() {
        
    }
}

private extension ProductDetailsViewModel {
    func getDetails() {
        Task {
            do {
                entity = try await useCase.getDetails()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
