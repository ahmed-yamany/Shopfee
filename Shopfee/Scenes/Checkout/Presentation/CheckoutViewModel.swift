//
//  CheckoutViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 15/05/2024.
//

import SwiftUI
import Combine

@MainActor
protocol CheckoutViewModelProtocol: ObservableObject {
    var cart: [CartEntity] { get set }
}

@MainActor
final class CheckoutViewModel: CheckoutViewModelProtocol {
    @Published var cart: [CartEntity] = []
    var cartCancellable: Cancellable?
    
    private let coordinator: CheckoutCoordinatorProtocol
    private let useCase: CheckoutUseCaseProtocol
    
    init(coordinator: CheckoutCoordinatorProtocol, useCase: CheckoutUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
        bindCartPublisher()
    }
}

extension CheckoutViewModel {
    func bindCartPublisher() {
        Task {
            cartCancellable = await useCase.cartPublisher
                .receive(on: RunLoop.main)
                .assign(to: \.cart, on: self)
        }
    }
}
