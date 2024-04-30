//
//  OTPViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI

@MainActor
protocol OTPViewModelProtocol: ObservableObject {
    var phoneNumber: String { get set }
    var otp: String { get set }
    var otpLength: Int { get set }
    
    func resendOtp()
}

final class OTPViewModel: OTPViewModelProtocol {
    @Published var phoneNumber: String = "081234567891"
    @Published var otp: String = ""
    @Published var otpLength: Int = 5
    
    private let coordinator: OTPCoordinatorProtocol
    private let useCase: OTPUseCaseProtocol
    
    init(coordinator: OTPCoordinatorProtocol, useCase: OTPUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func resendOtp() {
        
    }
}
