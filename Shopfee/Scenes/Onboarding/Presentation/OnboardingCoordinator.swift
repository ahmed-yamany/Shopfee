//
//  OnboardingCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import Foundation

protocol OnboardingCoordinatorProtocol: Coordinator {
}

final class OnboardingCoordinator: OnboardingCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = OnboardingUseCase()
        let viewModel = OnboardingViewModel(coordinator: self, useCase: useCase)
        let controller = OnboardingViewController(viewModel: viewModel)
        router.push(controller)
    }
}
