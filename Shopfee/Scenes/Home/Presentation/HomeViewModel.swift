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

    private let offersSection = OfferSectionFactory.make()
    private let productsSection = ProductSectionFactory.make()

    private let coordinator: HomeCoordinatorProtocol
    private let useCase: HomeUseCaseProtocol
    
    init(coordinator: HomeCoordinatorProtocol, useCase: HomeUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
        compositionalLayoutSections = [offersSection, productsSection]
    }

    func notificationButtonTapped() {
        coordinator.navigateToNotifications()
    }
}
