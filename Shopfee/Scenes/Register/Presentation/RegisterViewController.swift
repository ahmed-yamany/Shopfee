//
//  RegisterViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 27/04/2024.
//

import SwiftUI

final class RegisterViewController<ViewModel: RegisterViewModelProtocol>: UIHostingController<RegisterView<ViewModel>> {
    init(viewModel: ViewModel) {
        super.init(rootView: RegisterView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
