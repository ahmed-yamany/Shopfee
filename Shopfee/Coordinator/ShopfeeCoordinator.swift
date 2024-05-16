//
//  ShopfeeCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.

import Combine
import Coordinator
import UIKit

protocol ShopfeeCoordinatorProtocol: Coordinator {
    func showOnboarding()
    func showTabBar()
    func addToCart(_ entities: [CartEntity])
}

final class ShopfeeCoordinator: ShopfeeCoordinatorProtocol {
    static var shared = ShopfeeCoordinator()
    @Published var cart: [CartEntity] = []
    var cartPublisher: AnyPublisher<[CartEntity], Never> { $cart.eraseToAnyPublisher() }
    
    var window: UIWindow?
    let router: Router

    private init() {
        let navigationController = UINavigationController()
        router = ShopfeeRouter(navigationController: navigationController)
    }

    func makeWindow(from windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = router.navigationController
        window.makeKeyAndVisible()
        self.window = window
        start()
    }

    func start() {
        showTabBar()
//        showOnboarding()
    }

    func showOnboarding() {
        router.reset()
        SplashCoordinator(router: router).start()
    }

    func showTabBar() {
        router.reset()
        TabBarCoordinator(router: router, cartPublisher: cartPublisher).start()
    }
    
    func addToCart(_ entities: [CartEntity]) {
        cart.append(contentsOf: entities)
    }
}
