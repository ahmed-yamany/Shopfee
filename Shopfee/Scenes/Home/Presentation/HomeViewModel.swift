//
//  HomeViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import SwiftUI

@MainActor
protocol HomeViewModelProtocol: ObservableObject {}

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
    
    private let coordinator: HomeCoordinatorProtocol
    private let useCase: HomeUseCaseProtocol
    
    init(coordinator: HomeCoordinatorProtocol, useCase: HomeUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
}
