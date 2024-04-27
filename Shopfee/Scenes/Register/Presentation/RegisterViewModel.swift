//
//  RegisterViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 27/04/2024.
//

import SwiftUI

protocol RegisterViewModelProtocol: ObservableObject {
}

final class RegisterViewModel: RegisterViewModelProtocol {
    
    let coordinator: RegisterCoordinatorProtocol
    let useCase: RegisterUseCaseProtocol
    
    init(coordinator: RegisterCoordinatorProtocol, useCase: RegisterUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
}
