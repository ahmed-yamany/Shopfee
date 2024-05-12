//
//  TabBarItemFactory.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 04/05/2024.
//

import SwiftUI
import SwiftUIModifiers

@MainActor
protocol TabBarItemAbstractFactory {
    func make() -> any TabBarItem
}

struct HomeTabBarItemFactory: TabBarItemAbstractFactory {
    let tabBarCoordinator: TabBarCoordinatorProtocol
    
    func make() -> any TabBarItem {
        let navigationController = UINavigationController()
        let router = ShopfeeRouter(navigationController: navigationController)
        let coordinator = HomeCoordinator(router: router, tabBarCoordinator: tabBarCoordinator)
        coordinator.start()
        let view = navigationController.toSwiftUI().ignoresSafeArea().eraseToAnyView()
        return HomeTabBarItem(view: view)
    }
}

struct HistoryTabBarItemFactory: TabBarItemAbstractFactory {
    func make() -> any TabBarItem {
        HistoryTabBarItem(view: Text("Hello History").eraseToAnyView())
    }
}

struct AccountTabBarItemFactory: TabBarItemAbstractFactory {
    func make() -> any TabBarItem {
        AccountTabBarItem(view: Text("Hello Account").eraseToAnyView())
    }
}

@MainActor
struct TabBarItemFactory {
    let tabBarCoordinator: TabBarCoordinatorProtocol
        
    func make(for type: TabBarItemType) -> any TabBarItem {
        switch type {
            case .home:
                HomeTabBarItemFactory(tabBarCoordinator: tabBarCoordinator).make()
            case .history:
                HistoryTabBarItemFactory().make()
            case .account:
                AccountTabBarItemFactory().make()
        }
    }
}
