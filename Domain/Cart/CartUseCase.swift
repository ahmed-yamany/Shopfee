//
//  CartUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 16/05/2024.
//

import Foundation
import Combine

protocol CartUseCaseProtocol: AnyActor {
    @MainActor var cart: [CartEntity] { get set }
    @MainActor var cartPublisher: AnyPublisher<[CartEntity], Never> { get async }
    
    func add(_ cart: CartEntity) async throws
}

final actor CartUseCase: CartUseCaseProtocol {
    @MainActor @Published var cart: [CartEntity] = []
    @MainActor var cartPublisher: AnyPublisher<[CartEntity], Never> {
        get async {
            await $cart.eraseToAnyPublisher()
        }
    }
    
    func add(_ entity: CartEntity) async throws {
        await MainActor.run {
            cart.append(entity)
        }
    }
}
