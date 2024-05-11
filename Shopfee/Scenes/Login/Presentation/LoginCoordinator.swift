//
//  LoginCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import Foundation
import Coordinator

protocol LoginCoordinatorProtocol: Coordinator {
    func showRegister()
    func enterPin()
}

final class LoginCoordinator: LoginCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = LoginUseCase()
        let viewModel = LoginViewModel(coordinator: self, useCase: useCase)
        let controller = LoginViewController(viewModel: viewModel)
        router.setViewController(controller)
    }
    
    func showRegister() {
        RegisterCoordinator(router: router).start()
    }
    
    func enterPin() {
        EnterPinCoordinator(router: router).start()
    }
}
