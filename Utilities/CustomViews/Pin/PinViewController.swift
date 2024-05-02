//
//  CreatePinViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import SwiftUI

final class PinViewController<ViewModel: PinViewModelProtocol>: UIHostingController<PinView<ViewModel>> {
    
    init(viewModel: ViewModel) {
        super.init(rootView: PinView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
