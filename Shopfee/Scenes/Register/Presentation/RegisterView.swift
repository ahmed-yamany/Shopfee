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
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .applyPrimaryStyle()
    }
}

#Preview {
    let router = ShopfeeRouter(navigationController: .init())
    let coordinator = RegisterCoordinator(router: router)
    let useCase = RegisterUseCase()
    let viewModel = RegisterViewModel(coordinator: coordinator, useCase: useCase)
    return RegisterView(viewModel: viewModel)
}
