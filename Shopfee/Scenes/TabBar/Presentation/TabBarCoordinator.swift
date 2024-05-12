//
//  TabBarCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import Foundation
import Coordinator
import Combine

protocol TabBarCoordinatorProtocol: Coordinator {
    func viewDidDisAppear()
    func viewWillAppear()
    func showTabBar()
    func hideTabBar()
}

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    @Published var showHideTabBar: Bool = true
    var showTabBarPublisher: AnyPublisher<Bool, Never> { $showHideTabBar.eraseToAnyPublisher() }
    
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let tabBarItemFactory = TabBarItemFactory(tabBarCoordinator: self)
        let useCase = TabBarUseCase(tabBarItemFactory: tabBarItemFactory)
        let viewModel = TabBarViewModel(coordinator: self, useCase: useCase, showTabBarPublisher: showTabBarPublisher)
        let controller = TabBarViewController(viewModel: viewModel)
        router.setViewController(controller)
    }
    
    func viewWillAppear() {
        router.navigationBarIsHidden = true
    }
    
    func viewDidDisAppear() {
        router.navigationBarIsHidden = false
    }
    
    func showTabBar() {
        showHideTabBar = true
    }
    
    func hideTabBar() {
        showHideTabBar = false
    }
}
