//
//  ReceiptCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import Foundation
import Coordinator

protocol ReceiptCoordinatorProtocol: Coordinator {
}

final class ReceiptCoordinator: ReceiptCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = ReceiptUseCase()
        let viewModel = ReceiptViewModel(coordinator: self, useCase: useCase)
        let controller = ReceiptViewController(viewModel: viewModel)
        router.replaceLast(with: controller)
    }
}
