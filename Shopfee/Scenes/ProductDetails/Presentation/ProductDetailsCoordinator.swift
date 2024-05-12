//
//  ProductDetailsCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import Foundation
import Coordinator

protocol ProductDetailsCoordinatorProtocol: Coordinator {
    func viewWillAppear()
}

final class ProductDetailsCoordinator: ProductDetailsCoordinatorProtocol {
    let router: Router
    let product: ProductCellModel
    let onAppear: Action
   
    init(router: Router, product: ProductCellModel, onAppear: @escaping Action) {
        self.router = router
        self.product = product
        self.onAppear = onAppear
    }
    
    func start() {
        let useCase = ProductDetailsUseCase()
        let viewModel = ProductDetailsViewModel(coordinator: self, useCase: useCase)
        let controller = ProductDetailsViewController(viewModel: viewModel)
        router.push(controller)
    }
    
    func viewWillAppear() {
        onAppear()
    }
}
