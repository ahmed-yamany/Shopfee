//
//  ProductDetailsCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import Foundation

protocol ProductDetailsCoordinatorProtocol: Coordinator {
}

final class ProductDetailsCoordinator: ProductDetailsCoordinatorProtocol {
    let router: Router
    let product: ProductCellModel
    init(router: Router, product: ProductCellModel) {
        self.router = router
        self.product = product
    }
    
    func start() {
        let useCase = ProductDetailsUseCase()
        let viewModel = ProductDetailsViewModel(coordinator: self, useCase: useCase)
        let controller = ProductDetailsViewController(viewModel: viewModel)
        router.push(controller)
    }
}
