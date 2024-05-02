//
//  ProcessAccountViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import SwiftUI

// swiftlint: disable line_length
final class ProcessAccountViewController<ViewModel: ProcessAccountViewModelProtocol>: UIHostingController<ProcessAccountView<ViewModel>> {
    // swiftlint: enable line_length
    init(viewModel: ViewModel) {
        super.init(rootView: ProcessAccountView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
