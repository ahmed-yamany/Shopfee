//
//  OTPViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI

@MainActor
protocol OTPViewModelProtocol: ObservableObject {
    var phoneNumber: String { get }
    var otp: String { get set }
    var otpLength: Int { get set }
    
    func isEnabledConfirmButton() -> Bool
    func resendOtp()
}

final class OTPViewModel: OTPViewModelProtocol {
    @Published var phoneNumber: String
    @Published var otp: String = ""
    @Published var otpLength: Int = 5
    
    private let coordinator: OTPCoordinatorProtocol
    private let useCase: OTPUseCaseProtocol
    
    init(coordinator: OTPCoordinatorProtocol, useCase: OTPUseCaseProtocol, phoneNumber: String) {
        self.coordinator = coordinator
        self.useCase = useCase
        self.phoneNumber = phoneNumber
    }
    
    func isEnabledConfirmButton() -> Bool {
        otp.count == otpLength
    }
    
    func resendOtp() {
        coordinator.resend()
    }
}
