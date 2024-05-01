//
//  OTPViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI

final class OTPViewController<ViewModel: OTPViewModelProtocol>: UIHostingController<OTPView<ViewModel>> {
    
    init(viewModel: ViewModel) {
        super.init(rootView: OTPView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
