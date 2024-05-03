//
//  TabBarCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import Foundation

protocol TabBarCoordinatorProtocol: Coordinator {
}

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = TabBarUseCase()
        let viewModel = TabBarViewModel(coordinator: self, useCase: useCase)
        let controller = TabBarViewController(viewModel: viewModel)
        router.setViewController(controller)
    }
}