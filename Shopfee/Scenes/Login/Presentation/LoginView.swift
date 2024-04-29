//
//  LoginView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 28) {
                ShopfeeLogo()
                
                VStack(spacing: 16) {
                    textfields
                    loginButton
                }
            }
            
            Spacer()
            
            registerView
        }
        .padding(.safeAreaPadding)
        .applyPrimaryStyle()
    }
    
    private var textfields: some View {
            ShopfeeTextField(
                title: "No. Handphone".localized,
                placeholder: "Input your No. Handphone".localized,
                text: $viewModel.phoneNumber
            )
    }
    
    private var loginButton: some View {
        Button("login".localized) {
            viewModel.startLogin()
        }
        .buttonStyle(.primary())
        .disabled(!viewModel.enableButton())
    }
    
    private var registerView: some View {
        HStack {
            Text("Don’t have an account?".localized)
                .foregroundStyle(.textParagraph)
            
            Button("register".localized) {
                viewModel.navigateToRegister()
            }
            .foregroundStyle(.brand)
        }
        .font(.custom(size: 14, weight: .medium))
    }
}

#Preview {
    let router = ShopfeeRouter(navigationController: .init())
    let coordinator = LoginCoordinator(router: router)
    let useCase = LoginUseCase()
    let viewModel = LoginViewModel(coordinator: coordinator, useCase: useCase)
    return LoginView(viewModel: viewModel)
}
