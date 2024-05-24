//
//  CheckoutCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 15/05/2024.
//

import SwiftUI
import Coordinator

protocol CheckoutCoordinatorProtocol: Coordinator {
    func showReceipt()
}

final class CheckoutCoordinator: CheckoutCoordinatorProtocol {
    let router: Router
    let cartUseCase: CartUseCaseProtocol
    
    init(router: Router, cartUseCase: CartUseCaseProtocol) {
        self.router = router
        self.cartUseCase = cartUseCase
    }
    
    func start() {
        let useCase = CheckoutUseCase(cartUseCase: cartUseCase)
        let viewModel = CheckoutViewModel(coordinator: self, useCase: useCase)
        let controller = CheckoutViewController(viewModel: viewModel)
        router.push(controller)
    }
    
    func showReceipt() {
        ReciptCoordinator(router: router).start()
    }
}
