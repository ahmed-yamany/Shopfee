//
//  TabBarViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import SwiftUI

@MainActor
protocol TabBarViewModelProtocol: ObservableObject {
    var items: [any TabBarItem] { get set }
    var selectedItem: TabBarItemTypes { get set }
    
    func viewDidLoad()
}

@MainActor
final class TabBarViewModel: TabBarViewModelProtocol {
    @Published var items: [any TabBarItem] = []
    @Published var selectedItem: TabBarItemTypes = .home
    
    private let coordinator: TabBarCoordinatorProtocol
    private let useCase: TabBarUseCaseProtocol
    
    init(coordinator: TabBarCoordinatorProtocol, useCase: TabBarUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
        viewDidLoad()
    }
    
    func viewDidLoad() {
        getItems()
    }
}

private extension TabBarViewModel {
    func getItems() {
        Task {
            do {
                let items = try await useCase.getTabBarItems()
                updateItems(with: items)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func updateItems(with items: [any TabBarItem]) {
        self.items = items
    }
}