//
//  SplashCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import Foundation

protocol SplashCoordinatorProtocol: Coordinator {
    
}

final class SplashCoordinator: SplashCoordinatorProtocol {
    let router: any Router
    
    init(router: any Router) {
        self.router = router
    }
    
    func start() {
        let controller = SplashViewController()
        router.setViewController(controller, animated: false)
        Task.detached {
            try? await Task.sleep(for: .seconds(4))
            await self.showOnboarding()
        }
    }
    
    func showOnboarding() {
        let coordinator = OnboardingCoordinator(router: router)
        coordinator.start()
    }
}
