//
//  EnterPinCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import Foundation

protocol EnterPinCoordinatorProtocol: Coordinator {
}

final class EnterPinCoordinator: EnterPinCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = EnterPinUseCase()
        let viewModel = EnterPinViewModel(coordinator: self, useCase: useCase)
        let controller = PinViewController(viewModel: viewModel)
        router.push(controller)
    }
}
