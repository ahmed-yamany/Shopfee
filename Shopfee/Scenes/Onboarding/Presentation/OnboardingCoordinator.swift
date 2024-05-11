//
//  OnboardingCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import Foundation
import Coordinator

protocol OnboardingCoordinatorProtocol: Coordinator {
    func showRegister()
}

final class OnboardingCoordinator: OnboardingCoordinatorProtocol {
    let router: Router
    let transitioningDelegate = OpenFromCenterTransitioningDelegate()
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = OnboardingUseCase()
        let viewModel = OnboardingViewModel(coordinator: self, useCase: useCase)
        let controller = OnboardingViewController(viewModel: viewModel)
        router.present(controller, transitioningDelegate: transitioningDelegate)
    }
    
    func showRegister() {
        let coordinator = RegisterCoordinator(router: router)
        coordinator.start()
    }
}
