//
//  SendOTPViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 01/05/2024.
//

import SwiftUI

protocol SendOTPViewModelProtocol: ObservableObject {
    func onAppear() async
}

class SendOTPViewModel: SendOTPViewModelProtocol {
    
    private let coordinator: SendOTPCoordinatorProtocol
    private let useCase: SendOTPUseCaseProtocol
    private let phoneNumber: String
    
    init(coordinator: SendOTPCoordinatorProtocol, useCase: SendOTPUseCaseProtocol, phoneNumber: String) {
        self.coordinator = coordinator
        self.useCase = useCase
        self.phoneNumber = phoneNumber
    }
    
    func onAppear() async {
        try? await Task.sleep(for: .seconds(8))
        await showEnterOtp()
    }
    
    @MainActor
    private func showEnterOtp() {
        coordinator.showEnterOtp(for: phoneNumber)
    }
}
