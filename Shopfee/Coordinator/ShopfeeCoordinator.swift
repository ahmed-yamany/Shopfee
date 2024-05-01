//
//  ShopfeeCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.

import UIKit

protocol ShopfeeCoordinatorProtocol: Coordinator {
    func showOnboarding()
}

final class ShopfeeCoordinator: ShopfeeCoordinatorProtocol {
    static var shared = ShopfeeCoordinator()
    var window: UIWindow?
    let router: Router
    
    private init() {
        let navigationController = UINavigationController()
        self.router = ShopfeeRouter(navigationController: navigationController)
    }
    
    func makeWindow(from windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = self.router.navigationController
        window.makeKeyAndVisible()
        self.window = window
        self.start()
    }
    
    func start() {
        showOnboarding()
    }
    
    func showOnboarding() {
        router.reset()
        let coordinator = SplashCoordinator(router: router)
        coordinator.start()
    }
}
