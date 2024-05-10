//
//  ProductDetailsViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI

final class ProductDetailsViewController<ViewModel: ProductDetailsViewModelProtocol>: UIHostingController<ProductDetailsView<ViewModel>> {
    
    init(viewModel: ViewModel) {
        super.init(rootView: ProductDetailsView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
