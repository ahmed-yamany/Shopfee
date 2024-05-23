//
//  CartUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 16/05/2024.
//

import Foundation
import Combine
import UIExtensions
import FoundationExtensions

protocol CartUseCaseProtocol: AnyActor {
    @MainActor var cart: [CartEntity] { get set }
    @MainActor var cartPublisher: AnyPublisher<[CartEntity], Never> { get async }
    
    func viewDidLoad() async throws
    func add(_ cart: CartEntity) async throws
}

final actor CartUseCase: CartUseCaseProtocol {
    @MainActor @Published var cart: [CartEntity] = []
    @MainActor var cartPublisher: AnyPublisher<[CartEntity], Never> {
        get async {
            await $cart.eraseToAnyPublisher()
        }
    }
    
    let repositoryClosure: () -> CartRepositoryProtocol
    
    init(repositoryClosure: @escaping () -> CartRepositoryProtocol) {
        self.repositoryClosure = repositoryClosure
    }
    
    func viewDidLoad() async throws {
        try await loadEntities()
    }
    
    func add(_ entity: CartEntity) async throws {
        try await save(entity)
        await MainActor.run {
            cart.append(entity)
        }
    }
}

extension CartUseCase {
    func loadEntities() async throws {
        let repository: CartRepositoryProtocol = repositoryClosure()
        let allCartModels = try await repository.fetchAll(sortBy: \.price)
        
        for cartModel in allCartModels {
            let customize: [ProductCustomizeModel] = cartModel.customize?.toArray() ?? []
            let extra: [ProductExtraModel] = cartModel.extra?.toArray() ?? []
            let cartEntity = CartEntity(cartModel: cartModel, customize: customize, extra: extra)
            await MainActor.run {
                cart.append(cartEntity)
            }
        }
    }
    
    func save(_ entity: CartEntity) async throws {
        let repository: CartRepositoryProtocol = repositoryClosure()
        
        let cartModel = try await repository.newObject()
        // update cart Model
        await repository.perform {
            cartModel.id = UUID(uuidString: entity.id)
            cartModel.name = entity.name
            cartModel.currency = entity.currency
            cartModel.price = entity.price
            cartModel.imageUrl = entity.imageUrl
        }
        
        for customize in entity.customize {
            let customizeModel = try await repository.newCustomize()
            let image = await customize.image?.uiImage()
            // update Product Customize Model
            await repository.perform {
                customizeModel.id = UUID(uuidString: customize.id)
                customizeModel.image = image?.jpegData(compressionQuality: 0.5)
                customizeModel.title = customize.title
            }
        }
        
        for extra in entity.extra {
            let extraModel = try await repository.newExtra()
            // update Product Extra Model
            await repository.perform {
                extraModel.id = UUID(uuidString: extra.id)
                extraModel.title = extra.title
                extraModel.price = extra.price
                extraModel.currency = extra.currency
            }
        }
        
        // save to core data
        try await repository.save()
    }
}
