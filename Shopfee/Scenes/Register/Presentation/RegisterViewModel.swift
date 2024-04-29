//
//  RegisterViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 27/04/2024.
//

import SwiftUI

@MainActor
protocol RegisterViewModelProtocol: ObservableObject {
    var name: String { get set }
    var phoneNumber: String { get set }
    
    func enableButton() -> Bool
    func startRegister()
    func navigateToLogin()
    func navigateToPrivacy()
    func navigateToTerms()
}

final class RegisterViewModel: RegisterViewModelProtocol {
    @Published var name: String = ""
    @Published var phoneNumber: String = ""
    
    private let coordinator: RegisterCoordinatorProtocol
    private let useCase: RegisterUseCaseProtocol
    
    init(coordinator: RegisterCoordinatorProtocol, useCase: RegisterUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func enableButton() -> Bool {
        true
    }
    
    func startRegister() {
        coordinator.showOTP()
    }
    
    func navigateToLogin() {
        coordinator.showLogin()
    }
    
    func navigateToPrivacy() {
        coordinator.showPrivacy()
    }
    
    func navigateToTerms() {
        coordinator.showTerms()
    }
}
