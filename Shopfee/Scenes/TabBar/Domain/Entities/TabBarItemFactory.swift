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
    func make() -> any TabBarItem {
        let navigationController = UINavigationController()
        let router = ShopfeeRouter(navigationController: navigationController)
        let coordinator = HomeCoordinator(router: router)
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
    func make(for type: TabBarItemType) -> any TabBarItem {
        switch type {
            case .home:
                HomeTabBarItemFactory().make()
            case .history:
                HistoryTabBarItemFactory().make()
            case .account:
                AccountTabBarItemFactory().make()
        }
    }
}
