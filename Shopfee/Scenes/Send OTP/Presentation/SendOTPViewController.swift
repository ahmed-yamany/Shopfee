//
//  SendOTPViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 01/05/2024.
//

import SwiftUI

final class SendOTPViewController<ViewModel: SendOTPViewModelProtocol>: UIHostingController<SendOTPView<ViewModel>> {
    init(viewModel: ViewModel) {
        super.init(rootView: SendOTPView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
