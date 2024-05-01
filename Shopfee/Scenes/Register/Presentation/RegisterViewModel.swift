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

@MainActor
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
        !name.isEmpty && !phoneNumber.isEmpty
    }
    
    func startRegister() {
        coordinator.showPopUp(
            item: .otp(to: phoneNumber),
            onPrimaryAction: { [weak self] in
                guard let self = self else { return }
                confirmRegistration()
            },
            onSecondaryAction: { [weak self] in
                guard let self = self else { return }
                coordinator.dismiss()
            }
        )
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

private extension RegisterViewModel {
    func confirmRegistration() {
        Task {
            do {
                try await useCase.registerUser(withName: name, andPhoneNumber: phoneNumber)
                sendOtp()
            } catch {
                
            }
        }
    }
    
    func sendOtp() {
        coordinator.sendOtp(to: phoneNumber)
    }
}
