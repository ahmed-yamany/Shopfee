//
//  CartUseCaseFactory.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import Foundation

struct CartUseCaseFactory {
    static func make() -> CartUseCaseProtocol {
        let repositoryClosure = {
            let context = ShopfeePersistentContainer.shared.newBackgroundContext()
            return CartRepository(context: context)
        }
        
        return CartUseCase(repositoryClosure: repositoryClosure)
    }
}
