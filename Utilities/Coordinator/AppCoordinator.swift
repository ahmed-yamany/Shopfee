//
//  AppCoordinator.swift
//  Typa
//
//  Created by Ahmed Yamany on 26/02/2024.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
}

final class AppCoordinator: AppCoordinatorProtocol {
    static var shared = AppCoordinator()
    var window: UIWindow?
    let router: Router
    
    private init() {
        let navigationController = UINavigationController()
        self.router = AppRouter(navigationController: navigationController)
    }
    
    func makeWindow(from windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = self.router.navigationController
        window.makeKeyAndVisible()
        self.window = window
        self.start()
    }
    
    func start() {
        let controller = ViewController()
        router.setViewController(controller)
    }
}
