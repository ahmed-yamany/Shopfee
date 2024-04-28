//
//  RegisterCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 27/04/2024.
//

import Foundation

protocol RegisterCoordinatorProtocol: Coordinator {
    func showLogin()
    func showPrivacy()
    func showTerms()
}

final class RegisterCoordinator: RegisterCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = RegisterUseCase()
        let viewModel = RegisterViewModel(coordinator: self, useCase: useCase)
        let controller = RegisterViewController(viewModel: viewModel)
        router.setViewController(controller)
    }
    
    func showLogin() {
        
    }
    
    func showPrivacy() {
        print("show Privacy")
    }
    
    func showTerms() {
        print("show Terms")
    }
}
