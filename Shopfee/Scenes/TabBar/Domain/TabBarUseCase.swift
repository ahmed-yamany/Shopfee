//
//  TabBarUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import Combine
import SwiftUI

protocol TabBarUseCaseProtocol {
    var cartPublisher: AnyPublisher<[CartEntity], Never> { get async }
    func getTabBarItems() async throws -> [any TabBarItem]
}

final class TabBarUseCase: TabBarUseCaseProtocol {
    var cartPublisher: AnyPublisher<[CartEntity], Never> {
        get async {
            await cartUseCase.cartPublisher
        }
    }

    private let tabBarItemFactory: TabBarItemFactory
    private let cartUseCase: CartUseCaseProtocol
    
    init(tabBarItemFactory: TabBarItemFactory, cartUseCase: CartUseCaseProtocol) {
        self.tabBarItemFactory = tabBarItemFactory
        self.cartUseCase = cartUseCase
    }

    func getTabBarItems() async throws -> [any TabBarItem] {
        var items: [any TabBarItem] = []

        for type in TabBarItemType.allCases {
            items.append(await tabBarItemFactory.make(for: type))
        }
        
        return items
    }
}
