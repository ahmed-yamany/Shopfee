//
//  TabBarViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import SwiftUI
import Combine

@MainActor
protocol TabBarViewModelProtocol: ObservableObject {
    var items: [any TabBarItem] { get set }
    var selectedItem: TabBarItemType { get set }
    var showTabBar: Bool { get set }
    
    func viewWillAppear()
    func viewDidLoad()
    func viewDidDisAppear()
}

@MainActor
final class TabBarViewModel: TabBarViewModelProtocol {
    @Published var items: [any TabBarItem] = []
    @Published var selectedItem: TabBarItemType = .home
    @Published var showTabBar: Bool = true
    var showTabBarCancellable: Cancellable?
    
    private let coordinator: TabBarCoordinatorProtocol
    private let useCase: TabBarUseCaseProtocol
    private let showTabBarPublisher: AnyPublisher<Bool, Never>
    
    init(coordinator: TabBarCoordinatorProtocol, useCase: TabBarUseCaseProtocol, showTabBarPublisher: AnyPublisher<Bool, Never>) {
        self.coordinator = coordinator
        self.useCase = useCase
        self.showTabBarPublisher = showTabBarPublisher
    }
    
    deinit {
        showTabBarCancellable?.cancel()
    }
    
    func viewWillAppear() {
        coordinator.viewWillAppear()
    }
    
    func viewDidLoad() {
        getItems()
        bindShowTabBar()
    }
    
    func viewDidDisAppear() {
        coordinator.viewDidDisAppear()
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
    
    func bindShowTabBar() {
        showTabBarCancellable = showTabBarPublisher.assign(to: \.showTabBar, on: self)
    }
}
