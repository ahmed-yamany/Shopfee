//
//  LoginViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI

final class LoginViewController<ViewModel: LoginViewModelProtocol>: UIHostingController<LoginView<ViewModel>> {
    
    init(viewModel: ViewModel) {
        super.init(rootView: LoginView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
