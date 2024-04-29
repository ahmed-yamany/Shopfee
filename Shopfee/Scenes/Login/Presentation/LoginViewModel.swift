//
//  LoginViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI

@MainActor
protocol LoginViewModelProtocol: ObservableObject {
    var phoneNumber: String { get set }
    
    func enableButton() -> Bool
    func startLogin()
    func navigateToRegister()
}

final class LoginViewModel: LoginViewModelProtocol {
    @Published var phoneNumber: String = ""
    
    private let coordinator: LoginCoordinatorProtocol
    private let useCase: LoginUseCaseProtocol
    
    init(coordinator: LoginCoordinatorProtocol, useCase: LoginUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func enableButton() -> Bool {
        true
    }
    
    func startLogin() {
        
    }
    
    func navigateToRegister() {
        coordinator.showRegister()
    }
}
