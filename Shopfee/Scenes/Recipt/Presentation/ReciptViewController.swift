//
//  ReciptViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import SwiftUI

final class ReciptViewController<ViewModel: ReciptViewModelProtocol>: UIHostingController<ReciptView<ViewModel>> {
    
    init(viewModel: ViewModel) {
        super.init(rootView: ReciptView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
