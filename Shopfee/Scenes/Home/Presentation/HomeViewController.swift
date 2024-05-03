//
//  HomeViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import UIKit

final class HomeViewController<ViewModel: HomeViewModelProtocol>: UIViewController {
    
    init(viewModel: ViewModel) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .blue
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
