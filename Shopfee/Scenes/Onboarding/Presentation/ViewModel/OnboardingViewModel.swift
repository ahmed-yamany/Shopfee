//
//  OnboardingViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI

protocol OnboardingViewModelProtocol: ObservableObject {
    var selectedPageIndex: Int { get set }
    var tabViewModels: [OnboardingTabViewModel] { get set }
    
    func onAppear()
    func skip()
    func next()
    func isPaginationReachedEnd() -> Bool
    
}

final class OnboardingViewModel: OnboardingViewModelProtocol {
    @Published var selectedPageIndex: Int = 0
    @Published var tabViewModels: [OnboardingTabViewModel] = []
    
    let coordinator: OnboardingCoordinatorProtocol
    let useCase: OnboardingUseCaseProtocol
    
    init(coordinator: OnboardingCoordinatorProtocol, useCase: OnboardingUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func onAppear() {
        getTabViewModels()
    }
    
    func skip() {
        coordinator.showRegister()
    }
    
    func next() {
        if !isPaginationReachedEnd() {
            selectedPageIndex += 1
        } else {
            skip()
        }
    }
    
    func isPaginationReachedEnd() -> Bool {
        selectedPageIndex >= tabViewModels.count - 1
    }
}

private extension OnboardingViewModel {
    func getTabViewModels() {
        Task {
            do {
                let models = try await useCase.getTabViewModels()
                await updateTabViewModels(with: models)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func updateTabViewModels(with models: [OnboardingTabViewModel]) {
        tabViewModels = models
    }
}
