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
    var compositionalLayoutSectionsPublisher: AnyPublisher<[CompositionalLayoutableSection], Never> { get }
    var searchText: String { get set }
    var searchPlaceholder: String { get set }
    
    func notificationButtonTapped()
}

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
    @Published var compositionalLayoutSections: [CompositionalLayoutableSection] = []
    var compositionalLayoutSectionsPublisher: AnyPublisher<[CompositionalLayoutableSection], Never> {
        $compositionalLayoutSections.eraseToAnyPublisher()
    }
    
    // you can sink on searchText to show another view controller that shows search results
    // or send to productsSection or its viewModels to updates its items based on search 
    @Published var searchText: String = ""
    @Published var searchPlaceholder: String = "What would you like to drink today?"
    
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
