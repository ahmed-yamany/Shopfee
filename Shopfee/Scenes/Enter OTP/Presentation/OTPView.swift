//
//  OTPView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI
import SwiftUIModifiers

struct OTPView<ViewModel: OTPViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 32) {
            phoneNumberView
            otpTextField
            resendView
            Spacer()
            confirmButton
        }
        .navigationTitle("Confirm OTP code".localized)
        .padding(.vertical, .safeAreaPadding)
        .padding(.safeAreaPadding)
        .applyPrimaryStyle()
    }
    
    private var phoneNumberView: some View {
        VStack(spacing: 0) {
            Text(viewModel.phoneNumber)
                .font(.custom(size: 24, weight: .medium))
            
            Text("otp hint".localized)
                .font(.custom(size: 12, weight: .regular))
                .multilineTextAlignment(.center)
                .frame(minHeight: 44)
        }
    }
    
    private var otpTextField: some View {
        ShopfeeOTPTextField(otp: $viewModel.otp, otpLength: viewModel.otpLength)
    }
    
    private var resendView: some View {
        HStack(spacing: 2) {
            Text("Haven't got the confirmation code yet?".localized)
                .font(.custom(size: 12, weight: .regular))
                .multilineTextAlignment(.center)
                .frame(minHeight: 44)
            
            Button("Resend".localized) {
                viewModel.resendOtp()
            }
            .buttonStyle(.info)
        }
    }
    
    private var confirmButton: some View {
        Button("Confirm".localized) {
            viewModel.confirm()
        }
        .buttonStyle(.primary())
        .disabled(!viewModel.isEnabledConfirmButton())
    }
}

#Preview {
    let router = ShopfeeRouter(navigationController: .init())
    let coordinator = OTPCoordinator(router: router, phoneNumber: "081234567891")
    let useCase = OTPUseCase()
    let viewModel = OTPViewModel(coordinator: coordinator, useCase: useCase, phoneNumber: "081234567891")
    return OTPView(viewModel: viewModel)
}
