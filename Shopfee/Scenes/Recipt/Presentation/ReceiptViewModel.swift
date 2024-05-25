//
//  ReciptViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import SwiftUI

@MainActor
protocol ReciptViewModelProtocol: ObservableObject {}

@MainActor
final class ReceiptViewModel: ReciptViewModelProtocol {
    
    private let coordinator: ReceiptCoordinatorProtocol
    private let useCase: ReciptUseCaseProtocol
    
    init(coordinator: ReceiptCoordinatorProtocol, useCase: ReciptUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
}
