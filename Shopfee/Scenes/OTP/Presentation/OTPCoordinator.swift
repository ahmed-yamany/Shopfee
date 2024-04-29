//
//  OTPCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import Foundation

protocol OTPCoordinatorProtocol: Coordinator {
    
}

final class OTPCoordinator: OTPCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = OTPUseCase()
        let viewModel = OTPViewModel(coordinator: self, useCase: useCase)
        let controller = OTPViewController(viewModel: viewModel)
        router.push(controller)
    }
}
