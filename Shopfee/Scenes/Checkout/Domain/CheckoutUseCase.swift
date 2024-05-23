//
//  CheckoutUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 15/05/2024.
//

import Foundation
import Combine

protocol CheckoutUseCaseProtocol {
    @MainActor var cartPublisher: AnyPublisher<[CartEntity], Never> { get async }
}

final actor CheckoutUseCase: CheckoutUseCaseProtocol {
    @MainActor var cartPublisher: AnyPublisher<[CartEntity], Never> {
        get async {
            await cartUseCase.cartPublisher
        }
    }
    
    let cartUseCase: CartUseCaseProtocol
    
    init(cartUseCase: CartUseCaseProtocol) {
        self.cartUseCase = cartUseCase
    }
}
