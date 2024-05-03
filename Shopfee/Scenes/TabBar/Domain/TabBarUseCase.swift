//
//  TabBarUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import Foundation

protocol TabBarUseCaseProtocol {
    func getTabBarItems() async throws -> [any TabBarItem]
}

final class TabBarUseCase: TabBarUseCaseProtocol {
    func getTabBarItems() async throws -> [any TabBarItem] {
        [
            HomeTabBarItem(),
            HistoryTabBarItem(),
            AccountTabBarItem()
        ]
    }
}
