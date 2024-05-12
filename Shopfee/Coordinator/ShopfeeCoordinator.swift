//
//  ShopfeeCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.

import UIKit
import Coordinator

protocol ShopfeeCoordinatorProtocol: Coordinator {
    func showOnboarding()
    func showTabBar()
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
        showTabBar()
//        showOnboarding()
    }
    
    func showOnboarding() {
        router.reset()
        SplashCoordinator(router: router).start()
    }
    
    func showTabBar() {
        router.reset()
        TabBarCoordinator(router: router).start()
    }
}
