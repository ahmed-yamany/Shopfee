//
//  ProductExtraRepository.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import Foundation
import CoreDataManager

protocol ProductExtraRepositoryProtocol {
    typealias Object = ProductExtraModel

    func save() async throws
    func newObject() async throws -> Object
}

final class ProductExtraRepository: ContextObjectManager<ProductExtraModel>, ProductExtraRepositoryProtocol {
    
}
