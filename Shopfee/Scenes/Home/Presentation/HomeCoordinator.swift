//
//  HomeCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import Foundation
import Domain
import Coordinator

protocol HomeCoordinatorProtocol: Coordinator {
    func navigateToNotifications()
    func productsSectionViewModel() -> ProductSectionViewModel
}

final class HomeCoordinator: HomeCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let imageUseCase = ImageUseCase()
        let useCase = HomeUseCase(imageUseCase: imageUseCase)
        let viewModel = HomeViewModel(coordinator: self, useCase: useCase)
        let controller = HomeViewController(viewModel: viewModel)
        router.setViewController(controller)
    }
    
    func navigateToNotifications() {
        
    }
    
    func productsSectionViewModel() -> ProductSectionViewModel {
        ProductSectionCoordinator(router: router).getViewModel()
    }
}
