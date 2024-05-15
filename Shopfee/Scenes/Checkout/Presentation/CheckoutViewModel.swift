//
//  CheckoutViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 15/05/2024.
//

import SwiftUI

@MainActor
protocol CheckoutViewModelProtocol: ObservableObject {}

@MainActor
final class CheckoutViewModel: CheckoutViewModelProtocol {
    
    private let coordinator: CheckoutCoordinatorProtocol
    private let useCase: CheckoutUseCaseProtocol
    
    init(coordinator: CheckoutCoordinatorProtocol, useCase: CheckoutUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
}
