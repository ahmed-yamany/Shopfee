//
//  LoginCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import Foundation

protocol LoginCoordinatorProtocol: Coordinator {
    func showRegister()
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
}
