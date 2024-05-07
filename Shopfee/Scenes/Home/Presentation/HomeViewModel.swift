//
//  HomeViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import CompositionalLayoutableSection
import Combine
import SwiftUI

@MainActor
protocol HomeViewModelProtocol: ObservableObject {
    var compositionalLayoutSections: [CompositionalLayoutableSection] { get set }
    var compositionalLayoutSectionsPublisher: Published<[CompositionalLayoutableSection]>.Publisher { get }

    func notificationButtonTapped()
}

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
    @Published var compositionalLayoutSections: [CompositionalLayoutableSection] = []
    var compositionalLayoutSectionsPublisher: Published<[CompositionalLayoutableSection]>.Publisher { $compositionalLayoutSections }

    private let coordinator: HomeCoordinatorProtocol
    private let useCase: HomeUseCaseProtocol
    private let offersSection = OfferCollectionViewSection()
    private let productsSection = ProductCollectionViewSection()
    
    init(coordinator: HomeCoordinatorProtocol, useCase: HomeUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
        compositionalLayoutSections = [offersSection, productsSection]
        onInit()
    }

    func notificationButtonTapped() {}
}

// MARK: - Private Methods
private extension HomeViewModel {
    func onInit() {
        productsSection.sectionDelegate = self
        fetchData()
    }
    
    func fetchData() {
        Task {
            do {
                try await Task.sleep(for: .seconds(2))
                let offers = try await useCase.getOffers()
                let products = try await useCase.getProducts()
                offersSection.items = offers
                productsSection.items = products
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}

// MARK: - ProductCollectionViewSectionDelegate
extension HomeViewModel: ProductCollectionViewSectionDelegate {
    func productCollectionViewSectionDelegate(_ section: ProductCollectionViewSection, prefetchProducts products: [ProductCellModel]) {
        Task {
            do {
                for product in products {
                    let image = try await useCase.fetchImage(from: product.imageUrl)
                    product.updateImage(image)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
