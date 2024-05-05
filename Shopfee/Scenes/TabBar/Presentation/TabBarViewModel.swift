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
    var selectedItem: TabBarItemType { get set }
    
    func viewDidLoad()
}

@MainActor
final class TabBarViewModel: TabBarViewModelProtocol {
    @Published var items: [any TabBarItem] = []
    @Published var selectedItem: TabBarItemType = .home
    
    private let coordinator: TabBarCoordinatorProtocol
    private let useCase: TabBarUseCaseProtocol
    
    init(coordinator: TabBarCoordinatorProtocol, useCase: TabBarUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
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
                self.items = items
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
