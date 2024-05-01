//
//  OTPCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import Foundation

protocol OTPCoordinatorProtocol: Coordinator {
    func resend()
}

final class OTPCoordinator: OTPCoordinatorProtocol {
    let router: Router
    let phoneNumber: String
    
    init(router: Router, phoneNumber: String) {
        self.router = router
        self.phoneNumber = phoneNumber
    }
    
    func start() {
        let useCase = OTPUseCase()
        let viewModel = OTPViewModel(coordinator: self, useCase: useCase, phoneNumber: phoneNumber)
        let controller = OTPViewController(viewModel: viewModel)
        router.push(controller)
    }
    
    func resend() {
        dismiss()
        SendOTPCoordinator(router: router, to: phoneNumber).start()
    }
}
