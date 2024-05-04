//
//  HomeView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 04/05/2024.
//

import CompositionalLayoutableSection
import CustomViews
import UIKit

final class HomeView<ViewModel: HomeViewModelProtocol>: UICollectionView, CompositionalLayoutProvider {
    var compositionalLayoutSections: [CompositionalLayoutableSection] = []
    
    lazy var compositionalDelegate = CompositionalLayoutDelegate(provider: self)
    lazy var compositionalDataSource = CompositionalLayoutDataSource(provider: self)
    
    let viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .null, collectionViewLayout: .init())
        delegate = compositionalDelegate
        dataSource = compositionalDataSource
        
        updateCollectionViewCompositionalLayout(for: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
