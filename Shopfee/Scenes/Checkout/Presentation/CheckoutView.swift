//
//  CheckoutView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 15/05/2024.
//

import SwiftUI
import SwiftUIViews

struct CheckoutView<ViewModel: CheckoutViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var offset: CGPoint = .zero
    
    var body: some View {
        TrackableScrollView(offset: $offset) {
            LazyVStack {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.cart) { product in
                        CheckoutProductView(product: product)
                    }
                }
                .padding(.safeAreaPadding)
                .background(.neutralLight)
            }
        }
        .navigationTitle("Checkout")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.brand50)
        .applyPrimaryStyle()
    }
}

#Preview {
    let cartUseCase = CartUseCaseFactory.make()
    let coordinator = CheckoutCoordinator(
        router: .init(navigationController: .init()),
        cartUseCase: cartUseCase
    )
    let useCase = CheckoutUseCase(cartUseCase: cartUseCase)
    let viewModel = CheckoutViewModel(coordinator: coordinator, useCase: useCase)
    return CheckoutView(viewModel: viewModel)
}
