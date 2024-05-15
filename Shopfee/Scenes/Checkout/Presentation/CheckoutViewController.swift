//
//  CheckoutViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 15/05/2024.
//

import SwiftUI

final class CheckoutViewController<ViewModel: CheckoutViewModelProtocol>: UIHostingController<CheckoutView<ViewModel>> {
    
    init(viewModel: ViewModel) {
        super.init(rootView: CheckoutView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
