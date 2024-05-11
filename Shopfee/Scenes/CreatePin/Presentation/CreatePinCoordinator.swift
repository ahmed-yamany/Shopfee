//
//  CreatePinCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import Foundation
import Coordinator

protocol CreatePinCoordinatorProtocol: Coordinator {
    func navigateToLogin()
}

final class CreatePinCoordinator: CreatePinCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = CreatePinUseCase()
        let viewModel = CreatePinViewModel(coordinator: self, useCase: useCase)
        let controller = PinViewController(viewModel: viewModel)
        router.push(controller)
    }
    
    func navigateToLogin() {
        LoginCoordinator(router: router).start()
    }
}
