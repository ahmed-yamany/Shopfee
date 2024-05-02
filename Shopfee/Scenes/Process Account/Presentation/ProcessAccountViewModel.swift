//
//  ProcessAccountViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import SwiftUI

@MainActor
protocol ProcessAccountViewModelProtocol: ObservableObject {
    func onAppear() async
}

@MainActor
final class ProcessAccountViewModel: ProcessAccountViewModelProtocol {
    
    private let coordinator: ProcessAccountCoordinatorProtocol
    private let useCase: ProcessAccountUseCaseProtocol
    
    init(coordinator: ProcessAccountCoordinatorProtocol, useCase: ProcessAccountUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func onAppear() async {
        try? await Task.sleep(for: .seconds(8))
        showCreatePin()
    }
    
    private func showCreatePin() {
        coordinator.createPin()
    }
}
