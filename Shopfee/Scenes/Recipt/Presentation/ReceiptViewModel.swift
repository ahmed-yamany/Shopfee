//
//  ReciptViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import SwiftUI

@MainActor
protocol ReceiptViewModelProtocol: ObservableObject {
    func done()
}

@MainActor
final class ReceiptViewModel: ReceiptViewModelProtocol {
    
    private let coordinator: ReceiptCoordinatorProtocol
    private let useCase: ReciptUseCaseProtocol
    
    init(coordinator: ReceiptCoordinatorProtocol, useCase: ReciptUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func done() {
        coordinator.dismiss()
    }
}
