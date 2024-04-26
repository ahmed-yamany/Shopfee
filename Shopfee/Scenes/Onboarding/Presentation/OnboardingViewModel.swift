//
//  OnboardingViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI

protocol OnboardingViewModelProtocol: ObservableObject {
    
}

final class OnboardingViewModel: OnboardingViewModelProtocol {
    
    let coordinator: OnboardingCoordinator
    let useCase: OnboardingUseCaseProtocol
    
    init(coordinator: OnboardingCoordinator, useCase: OnboardingUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
}
