//
//  ProductCustomizeRepository.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import Foundation
import CoreDataManager

protocol ProductCustomizeRepositoryProtocol {
    typealias Object = ProductCustomizeModel

    func save() async throws
    func newObject() async throws -> Object
    func deleteAll() async throws
}

final class ProductCustomizeRepository: ContextObjectManager<ProductCustomizeModel>, ProductCustomizeRepositoryProtocol {
    
}
