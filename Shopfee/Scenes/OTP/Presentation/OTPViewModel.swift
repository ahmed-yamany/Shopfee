//
//  OTPViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI

@MainActor
protocol OTPViewModelProtocol: ObservableObject {
    
}

final class OTPViewModel: OTPViewModelProtocol {
    private let coordinator: OTPCoordinatorProtocol
    private let useCase: OTPUseCaseProtocol
    
    init(coordinator: OTPCoordinatorProtocol, useCase: OTPUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
}
