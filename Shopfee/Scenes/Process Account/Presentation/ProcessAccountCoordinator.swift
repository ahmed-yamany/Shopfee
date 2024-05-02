//
//  ProcessAccountCoordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import Foundation

protocol ProcessAccountCoordinatorProtocol: Coordinator {
    func createPin()
}

final class ProcessAccountCoordinator: ProcessAccountCoordinatorProtocol {
    let router: Router
    let phoneNumber: String
    let otp: String
    
    init(router: Router, phoneNumber: String, otp: String) {
        self.router = router
        self.phoneNumber = phoneNumber
        self.otp = otp
    }
    
    func start() {
        let useCase = ProcessAccountUseCase()
        let viewModel = ProcessAccountViewModel(coordinator: self, useCase: useCase)
        let controller = ProcessAccountViewController(viewModel: viewModel)
        router.present(controller, presentationStyle: .overFullScreen)
    }
    
    func createPin() {
        CreatePinCoordinator(router: router).start()
    }
}
