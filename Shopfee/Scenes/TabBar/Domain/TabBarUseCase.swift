//
//  TabBarUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import Combine
import SwiftUI

protocol TabBarUseCaseProtocol {
    var cart: PassthroughSubject<[CartEntity], Error> { get }
    func getTabBarItems() async throws -> [any TabBarItem]
}

final class TabBarUseCase: TabBarUseCaseProtocol {
    let cart: PassthroughSubject<[CartEntity], Error> = .init()
    
    private let tabBarItemFactory: TabBarItemFactory
    private let cartPublisher: AnyPublisher<[CartEntity], Never>
    private var cartCancellable: Cancellable?
    
    init(tabBarItemFactory: TabBarItemFactory, cartPublisher: AnyPublisher<[CartEntity], Never>) {
        self.tabBarItemFactory = tabBarItemFactory
        self.cartPublisher = cartPublisher
        bindCartPublisher()
    }

    func getTabBarItems() async throws -> [any TabBarItem] {
        var items: [any TabBarItem] = []

        for type in TabBarItemType.allCases {
            items.append(await tabBarItemFactory.make(for: type))
        }
        
        return items
    }
}

private extension TabBarUseCase {
    func bindCartPublisher() {
        cartCancellable = cartPublisher.receive(on: RunLoop.main).sink { [weak self] cart in
            guard let self = self else {
                Logger.log("self is nil", category: \.default, level: .error)
                return
            }
            self.cart.send(cart)
        }
    }
}
