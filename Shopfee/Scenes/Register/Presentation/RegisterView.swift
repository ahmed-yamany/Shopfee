//
//  RegisterView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 27/04/2024.
//

import SwiftUI

struct RegisterView<ViewModel: RegisterViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 28) {
                ShopfeeLogo()
                
                VStack(spacing: 16) {
                    textfields
                    
                    termsAndConditions
                }
                
                registerButton
            }
            
            Spacer()
            
            loginView
        }
        .padding(.safeAreaPadding)
        .applyPrimaryStyle()
    }
    
    private var textfields: some View {
        VStack(spacing: 8) {
            ShopfeeTextField(
                title: "name".localized,
                placeholder: "input your name".localized,
                text: $viewModel.name
            )
            
            ShopfeeTextField(
                title: "No. Handphone".localized,
                placeholder: "Input your No. Handphone".localized,
                text: $viewModel.phoneNumber
            )
        }
    }
    
    private var termsAndConditions: some View {
        TermsAndCondition(
            privacyAction: {
                viewModel.navigateToPrivacy()
            }, termsAction: {
                viewModel.navigateToTerms()
            }
        )
    }
    
    private var registerButton: some View {
        Button("register".localized) {
            viewModel.startRegister()
        }
        .buttonStyle(.primary())
        .disabled(!viewModel.enableButton())
    }
    
    private var loginView: some View {
        HStack {
            Text("Have an account?".localized)
                .foregroundStyle(.textParagraph)
            
            Button("login".localized) {
                viewModel.navigateToLogin()
            }
            .foregroundStyle(.brand)
        }
        .font(.custom(size: 14, weight: .medium))
    }
}

#Preview {
    let router = ShopfeeRouter(navigationController: .init())
    let coordinator = RegisterCoordinator(router: router)
    let useCase = RegisterUseCase()
    let viewModel = RegisterViewModel(coordinator: coordinator, useCase: useCase)
    return RegisterView(viewModel: viewModel)
}
