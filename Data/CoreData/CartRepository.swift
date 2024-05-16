//
//  CartRepository.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 16/05/2024.
//

import Foundation
import CoreDataManager

protocol CartRepositoryProtocol {
    typealias Object = CartModel

    func save() async throws
    func newObject() async throws -> Object
    func fetchAll<SortType: Any>(
        sortBy sortKeyPath: KeyPath<Object, SortType>,
        fetchLimit: Int?,
        fetchOffset: Int,
        sortAscending: Bool
    ) async throws -> [Object]
}

extension CartRepositoryProtocol {
    func fetchAll<SortType: Any>(
        sortBy sortKeyPath: KeyPath<Object, SortType>,
        fetchLimit: Int? = nil,
        fetchOffset: Int = 0,
        sortAscending: Bool = true
    ) async throws -> [Object] {
        try await self.fetchAll(
            sortBy: sortKeyPath,
            fetchLimit: fetchLimit,
            fetchOffset: fetchOffset,
            sortAscending: sortAscending
        )
    }
}

final class CartRepository: ContextObjectManager<CartModel>, CartRepositoryProtocol {
    
}
