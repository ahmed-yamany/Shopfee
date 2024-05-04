//
//  TabBarUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import SwiftUI

protocol TabBarUseCaseProtocol: AnyActor {
    func getTabBarItems() async throws -> [any TabBarItem]
}

final actor TabBarUseCase: TabBarUseCaseProtocol {
    let tabBarItemFactory: TabBarItemFactory
    
    init(tabBarItemFactory: TabBarItemFactory) {
        self.tabBarItemFactory = tabBarItemFactory
    }
    
    func getTabBarItems() async throws -> [any TabBarItem] {
        var items: [any TabBarItem] = []
        
        for type in TabBarItemType.allCases {
            items.append( await tabBarItemFactory.make(for: type))
        }
        
        return items
    }
}
