//
//  EnterPinViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import SwiftUI

@MainActor
final class EnterPinViewModel: PinViewModelProtocol {
    @Published var pin: String = ""
    @Published var pinLength: Int = 6
    @Published var showPin: Bool = false
    
    @Published var image: Image = Image(.pin)
    @Published var navigationTitle: String = "Input your PIN".localized
    @Published var descriptionTitle: String = ""
    @Published var descriptionSubtitle: String = "Enter 6 digit PIN for secure account access"
    
    private let coordinator: EnterPinCoordinatorProtocol
    private let useCase: EnterPinUseCaseProtocol
    
    init(coordinator: EnterPinCoordinatorProtocol, useCase: EnterPinUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func isEnabledConfirmButton() -> Bool {
        true
    }
    
    func confirm() {
        
    }
}
