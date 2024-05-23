//
//  CartRepository.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 16/05/2024.
//

import Foundation
import CoreDataManager
import CoreData

protocol CartRepositoryProtocol {
    typealias Object = CartModel
    
    var extraRepository: ProductExtraRepositoryProtocol { get }
    var customizeRepository: ProductCustomizeRepositoryProtocol { get }

    func save() async throws
    func newObject() async throws -> Object
    
    func fetchAll<SortType: Any>(
        sortBy sortKeyPath: KeyPath<Object, SortType>,
        fetchLimit: Int?,
        fetchOffset: Int,
        sortAscending: Bool
    ) async throws -> [Object]
    
    func perform<T>(
        schedule: NSManagedObjectContext.ScheduledTaskType,
        _ block: @escaping () throws -> T
    ) async rethrows -> T
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
    
    func perform<T>(
        schedule: NSManagedObjectContext.ScheduledTaskType = .immediate,
        _ block: @escaping () throws -> T
    ) async rethrows -> T {
        try await self.perform(schedule: schedule, block)
    }
    
    func newCustomize() async throws -> ProductCustomizeModel {
        try await customizeRepository.newObject()
    }
    
    func newExtra() async throws -> ProductExtraModel {
        try await extraRepository.newObject()
    }
}

final class CartRepository: ContextObjectManager<CartModel>, CartRepositoryProtocol {
    lazy var customizeRepository: any ProductCustomizeRepositoryProtocol = ProductCustomizeRepository(context: context)
    lazy var extraRepository: any ProductExtraRepositoryProtocol = ProductExtraRepository(context: context)
}
