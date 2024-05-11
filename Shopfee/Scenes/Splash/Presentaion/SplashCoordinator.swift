//
//  SplashCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import Foundation
import Coordinator

protocol SplashCoordinatorProtocol: Coordinator {
    
}

final class SplashCoordinator: SplashCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
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
