//
//  TabBarViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import Combine
import SwiftUI

@MainActor
protocol TabBarViewModelProtocol: ObservableObject {
    var items: [any TabBarItem] { get set }
    var selectedItem: TabBarItemType { get set }
    var showTabBar: Bool { get set }

    var cart: [CartEntity] { get set }

    func viewWillAppear()
    func viewDidLoad()
    func viewDidDisAppear()
    func cartTotalPrice() -> String
    func cartTapped()
}

@MainActor
final class TabBarViewModel: TabBarViewModelProtocol {
    @Published var items: [any TabBarItem] = []
    @Published var selectedItem: TabBarItemType = .home
    @Published var showTabBar: Bool = true
    @Published var cart: [CartEntity] = []

    private var showTabBarCancellable: Cancellable?
    private var cartCancellable: Cancellable?

    private let coordinator: TabBarCoordinatorProtocol
    private let useCase: TabBarUseCaseProtocol
    private let showTabBarPublisher: AnyPublisher<Bool, Never>

    init(
        coordinator: TabBarCoordinatorProtocol,
        useCase: TabBarUseCaseProtocol,
        showTabBarPublisher: AnyPublisher<Bool, Never>
    ) {
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
        bindCartPublisher()
    }

    func viewDidDisAppear() {
        coordinator.viewDidDisAppear()
    }

    func cartTotalPrice() -> String {
        let currency = cart.first?.currency ?? ""
        let totalPrice = cart.map { $0.totalPrice }.reduce(0, +)

        return "\(currency)\(totalPrice)"
    }
    
    func cartTapped() {
        coordinator.showCheckout()
    }
}

private extension TabBarViewModel {
    func getItems() {
        Task {
            do {
                items = try await useCase.getTabBarItems()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func bindShowTabBar() {
        showTabBarCancellable = showTabBarPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.showTabBar, on: self)
    }

    func bindCartPublisher() {
        cartCancellable = useCase.cart.receive(on: RunLoop.main).sink { completion in
            switch completion {
            case .finished:
                return
            case let .failure(error):
                print(error.localizedDescription)
            }
        } receiveValue: { [weak self] cart in
            guard let self = self else {
                Logger.log("self is nil", category: \.default, level: .error)
                return
            }
            self.cart = cart
        }
    }
}
