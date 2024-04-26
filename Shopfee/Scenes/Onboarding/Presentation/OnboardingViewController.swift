//
//  OnboardingViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI

final class OnboardingViewController<ViewModel: OnboardingViewModelProtocol>: UIHostingController<OnboardingView<ViewModel>> {
    
    init(viewModel: ViewModel) {
        super.init(rootView: OnboardingView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
