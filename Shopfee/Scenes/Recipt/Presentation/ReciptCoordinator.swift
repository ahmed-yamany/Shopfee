//
//  ReciptCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import Foundation
import Coordinator

protocol ReciptCoordinatorProtocol: Coordinator {
}

final class ReciptCoordinator: ReciptCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = ReciptUseCase()
        let viewModel = ReciptViewModel(coordinator: self, useCase: useCase)
        let controller = ReciptViewController(viewModel: viewModel)
        router.replaceFirst(with: controller)
    }
}
