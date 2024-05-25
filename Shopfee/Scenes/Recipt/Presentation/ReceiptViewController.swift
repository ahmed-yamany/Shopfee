//
//  ReciptViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import SwiftUI

final class ReceiptViewController<ViewModel: ReciptViewModelProtocol>: UIHostingController<ReceiptView<ViewModel>> {
    
    init(viewModel: ViewModel) {
        super.init(rootView: ReceiptView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
