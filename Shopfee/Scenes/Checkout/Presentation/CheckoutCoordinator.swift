//
//  CheckoutCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 15/05/2024.
//

import Foundation
import Coordinator

protocol CheckoutCoordinatorProtocol: Coordinator {
}

final class CheckoutCoordinator: CheckoutCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = CheckoutUseCase()
        let viewModel = CheckoutViewModel(coordinator: self, useCase: useCase)
        let controller = CheckoutViewController(viewModel: viewModel)
        router.push(controller)
    }
}
