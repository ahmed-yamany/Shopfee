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
    func viewWillAppear()
    func showTabBar()
    func hideTabBar()
    func productsSectionViewModel() -> ProductSectionViewModel
}

final class HomeCoordinator: HomeCoordinatorProtocol {
    let router: Router
    let tabBarCoordinator: TabBarCoordinatorProtocol
    
    init(router: Router, tabBarCoordinator: TabBarCoordinatorProtocol) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
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
    
    func showTabBar() {
        tabBarCoordinator.showTabBar()
    }
    
    func hideTabBar() {
        tabBarCoordinator.hideTabBar()
    }
    
    func viewWillAppear() {
        showTabBar()
    }
    
    func productsSectionViewModel() -> ProductSectionViewModel {
        ProductSectionCoordinator(router: router, onShowDetails: { [weak self] in
            self?.hideTabBar()
        }).getViewModel()
    }
}
