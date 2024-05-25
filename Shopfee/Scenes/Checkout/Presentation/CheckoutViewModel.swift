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
    
    func totalPrice() -> String
    func checkout()
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
    
    func totalPrice() -> String {
        let currency = cart.first?.currency ?? ""
        let totalPrice = cart.map {$0.totalPrice}.reduce(0.0, +)
        
        return "\(currency). \(totalPrice)"
    }
    
    func checkout() {
        coordinator.startLoading()
        Task {
            try await Task.sleep(for: .seconds(3))
            try await useCase.checkout()
            coordinator.dismiss(animated: false)
            coordinator.showReceipt()
        }
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
