//
//  ProductDetailsView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI
import SwiftUIViews

struct ProductDetailsView<ViewModel: ProductDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State var offset: CGPoint = .zero
    
    var body: some View {
        TrackableScrollView(offset: $offset) {
            LazyVStack {
                ForEach(0..<1000, id: \.self) { int in
                    Text("Hello World! \(int)")
                }
            }
        }
        .navigationTitle("Customize Order")
        .frame(maxWidth: .infinity)
        .background(.brand50)
        .applyPrimaryStyle()
    }
}

#Preview {
    let router = ShopfeeRouter(navigationController: .init())
    let coordinator = ProductDetailsCoordinator(router: router,
                                                product: .sample,
                                                onAppear: {})
    let useCase = ProductDetailsUseCase()
    let viewModel = ProductDetailsViewModel(
        coordinator: coordinator,
        useCase: useCase
    )
    let controller = ProductDetailsViewController(viewModel: viewModel)
    router.setViewController(controller)
    return router.navigationController.toSwiftUI().ignoresSafeArea().eraseToAnyView()
}
