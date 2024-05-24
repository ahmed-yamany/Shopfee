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
final class ReciptViewModel: ReciptViewModelProtocol {
    
    private let coordinator: ReciptCoordinatorProtocol
    private let useCase: ReciptUseCaseProtocol
    
    init(coordinator: ReciptCoordinatorProtocol, useCase: ReciptUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
}
