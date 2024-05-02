//
//  CreatePinViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import SwiftUI

@MainActor
final class CreatePinViewModel: PinViewModelProtocol {
    @Published var pin: String = ""
    @Published var pinLength: Int = 6
    @Published var showPin: Bool = false
    
    @Published var image: Image = Image(.pin)
    @Published var navigationTitle: String = "Create a PIN".localized
    @Published var descriptionTitle: String = "Finally, Your final step...."
    @Published var descriptionSubtitle: String = "Enter 6 numbers to keep your account safe"
    
    private let coordinator: CreatePinCoordinatorProtocol
    private let useCase: CreatePinUseCaseProtocol
    
    init(coordinator: CreatePinCoordinatorProtocol, useCase: CreatePinUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func isEnabledConfirmButton() -> Bool {
        true
    }
    
    func confirm() {
        
    }
}
