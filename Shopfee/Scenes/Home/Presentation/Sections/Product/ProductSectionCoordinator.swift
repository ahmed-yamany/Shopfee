//
//  ProductSectionCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import Foundation
import Domain
import Coordinator

protocol ProductSectionCoordinatorProtocol: Coordinator {
    func getViewModel() -> ProductSectionViewModel
    func showDetails(for product: ProductCellModel)
}

final class ProductSectionCoordinator: ProductSectionCoordinatorProtocol {
    let router: Router
    var viewModel: ProductSectionViewModel!
    
    init(router: Router) {
        self.router = router
        self.viewModel = createViewModel()
    }
    
    func start() {
        
    }
    
    func getViewModel() -> ProductSectionViewModel {
        viewModel
    }
    
    func showDetails(for product: ProductCellModel) {
        ProductDetailsCoordinator(router: router, product: product).start()
    }
    
    private func createViewModel() -> ProductSectionViewModel {
        let imageUseCase = ImageUseCase()
        let useCase = ProductSectionUseCase(imageUseCase: imageUseCase)
        return ProductSectionViewModel(coordinator: self, useCase: useCase)
    }
}
