//
//  CreatePinView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import SwiftUI

@MainActor
protocol PinViewModelProtocol: ObservableObject {
    var pin: String { get set }
    var pinLength: Int { get set }
    var showPin: Bool { get set }
    
    var image: Image { get set }
    var navigationTitle: String { get set }
    var descriptionTitle: String { get set }
    var descriptionSubtitle: String { get set }
    
    func isEnabledConfirmButton() -> Bool
    func confirm()
}

struct PinView<ViewModel: PinViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 32) {
           
            VStack(spacing: 32) {
                image
                descriptionView
                pinTextField
            }
            
            Spacer()
            confirmButton
        }
        .navigationTitle(viewModel.navigationTitle)
        .padding(.vertical, .safeAreaPadding)
        .padding(.safeAreaPadding)
        .applyPrimaryStyle()
        .animation(.interactiveSpring(), value: viewModel.showPin)
    }
    
    private var image: some View {
        viewModel.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
    }
    
    private var descriptionView: some View {
        VStack(spacing: 8) {
            Text(viewModel.descriptionTitle)
                .font(.custom(size: 14, weight: .medium))
            
            Text(viewModel.descriptionSubtitle)
                .font(.custom(size: 14, weight: .regular))
        }
        .foregroundStyle(.textHeading)

    }
    
    private var pinTextField: some View {
        VStack {
            ShopfeePinTextField(
                pin: $viewModel.pin,
                pinLength: viewModel.pinLength,
                showPin: viewModel.showPin
            )
            
            showHidePin
        }
    }
    
    private var showHidePin: some View {
        Button {
            viewModel.showPin.toggle()
        } label: {
            HStack {
                Text(viewModel.showPin ? "hide pin" :"show pin")
                Image(systemName: viewModel.showPin ? "eye.slash" : "eye")
            }
        }
        .buttonStyle(.ghost)
        .frame(maxWidth: .infinity, alignment: .trailing)
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
    let coordinator = CreatePinCoordinator(router: router)
    let useCase = CreatePinUseCase()
    let viewModel = CreatePinViewModel(coordinator: coordinator, useCase: useCase)
    return PinView(viewModel: viewModel)
}
