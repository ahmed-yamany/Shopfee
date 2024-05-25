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
    
    func checkout() async throws
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
    
    func checkout() async throws {
        try await cartUseCase.removeAll()
    }
}
