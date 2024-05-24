//
//  ShopfeeCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.

import Combine
import Coordinator
import SwiftUI

struct ShopfeeCoordinatorCommand: SceneDelegateCommand {
    let scene: UIScene
    
    func execute() {
        guard let windowScene = (scene as? UIWindowScene) else {
            Logger.log("Failed to get window scene", category: \.default, level: .error)
            return
        }
        ShopfeeCoordinator.shared.makeWindow(from: windowScene)
    }
}

protocol ShopfeeCoordinatorProtocol: Coordinator {
    func showOnboarding()
    func showTabBar()
}

final class ShopfeeCoordinator: ShopfeeCoordinatorProtocol {
    static var shared = ShopfeeCoordinator()
    
    var cartUseCase: CartUseCaseProtocol!
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
        cartUseCase = CartUseCaseFactory.make()
        router.reset()
        TabBarCoordinator(router: router, cartUseCase: cartUseCase).start()
    }
}

extension Coordinator {
    func startLoading() {
        let controller = UIHostingController(rootView: ShopFeeActivityIndicator())
        controller.view.backgroundColor = .clear
        router.present(controller, animated: false, presentationStyle: .overFullScreen)
    }
}
