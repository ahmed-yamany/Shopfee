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

private extension HomeViewModel {
    func onInit() {
        getOffers()
        getProducts()
    }
    
    func getOffers() {
        Task {
            do {
                try await Task.sleep(for: .seconds(2))
                let offers = try await useCase.getOffers()
                offersSection.items = offers
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getProducts() {
        Task {
            do {
                try await Task.sleep(for: .seconds(2))
                let products = try await useCase.getProducts()
                productsSection.items = products
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
