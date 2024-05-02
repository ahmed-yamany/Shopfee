//
//  SendOTPCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 01/05/2024.
//

import Foundation

protocol SendOTPCoordinatorProtocol: Coordinator {
    func showEnterOtp(for phoneNumber: String)
}

final class SendOTPCoordinator: SendOTPCoordinatorProtocol {
    let router: Router
    let phoneNumber: String
    
    init(router: Router, to phoneNumber: String) {
        self.router = router
        self.phoneNumber = phoneNumber
    }
    
    func start() {
        let useCase = SendOTPUseCase()
        let viewModel = SendOTPViewModel(coordinator: self, useCase: useCase, phoneNumber: phoneNumber)
        let controller = SendOTPViewController(viewModel: viewModel)
        router.present(controller, presentationStyle: .overFullScreen)
    }
    
    func showEnterOtp(for phoneNumber: String) {
        OTPCoordinator(router: router, phoneNumber: phoneNumber).start()
    }
}
