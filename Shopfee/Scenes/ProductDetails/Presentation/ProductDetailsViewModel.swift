//
//  ProductDetailsViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI
import Combine

@MainActor
protocol ProductDetailsViewModelProtocol: ObservableObject {
    var entity: ProductDetailsEntity? { get set }
    var customizeItems: [FilterPickerItem] { get set }
    var extraItems: [ProductExtraEntity] { get set }
    var count: Int { get set }
    func totalPrice() -> Double
    
    func viewWillAppear()
    func ratingAndReviewsTapped()
    func addOrDeleteExtra(_ extra: ProductExtraEntity)
    func addOrder()
}

@MainActor
final class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    @Published var entity: ProductDetailsEntity?
    @Published var customizeItems: [FilterPickerItem] = []
    @Published var extraItems: [ProductExtraEntity] = []
    @Published var count: Int = 1
    
    private let coordinator: ProductDetailsCoordinatorProtocol
    private let useCase: ProductDetailsUseCaseProtocol
    
    init(coordinator: ProductDetailsCoordinatorProtocol, useCase: ProductDetailsUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func totalPrice() -> Double {
        let extraPrice = extraItems.map { $0.price }.reduce(0, +)
        let productPrice = entity?.price ?? 0
        return (extraPrice + productPrice) * Double(count)
    }
    
    func viewWillAppear() {
        coordinator.viewWillAppear()
        getDetails()
    }
    
    func ratingAndReviewsTapped() {
        coordinator.showRattingAndReviews()
    }
    
    func addOrDeleteExtra(_ extra: ProductExtraEntity) {
        if extraItems.contains(where: {$0 == extra}) {
            extraItems.removeAll(where: {$0 == extra})
        } else {
            extraItems.append(extra)
        }
    }
    
    func addOrder() {
        Task {
            do {
                try await useCase.addOrder(with: customizeItems, and: extraItems, count: count)
                coordinator.dismiss()
            } catch {
                print(error.localizedDescription)
            }
        }
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
