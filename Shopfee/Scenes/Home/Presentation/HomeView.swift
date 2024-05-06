//
//  HomeView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 04/05/2024.
//

import CompositionalLayoutableSection
import CustomViews
import Combine
import UIKit

final class HomeView: UICollectionView, CompositionalLayoutProvider {
    
    var compositionalLayoutSections: [CompositionalLayoutableSection] = []
    var cancellable: Set<AnyCancellable> = []
    
    lazy var compositionalDelegate = CompositionalLayoutDelegate(provider: self)
    lazy var compositionalDataSource = CompositionalLayoutDataSource(provider: self)
    
    let viewModel: any HomeViewModelProtocol
    init(viewModel: any HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .null, collectionViewLayout: .init())
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        cancellable.forEach { $0.cancel() }
    }
}

private extension HomeView {
    func configureLayout() {
        backgroundColor = .neutralLight
        delegate = compositionalDelegate
        dataSource = compositionalDataSource
        bindViewModel()
    }
    
    func bindViewModel() {
        bindSections()
    }
    
    func bindSections() {
        viewModel.compositionalLayoutSectionsPublisher.sink {[weak self] sections in
            guard let self = self else { return }
            compositionalLayoutSections = sections
            updateCompositionalLayout(for: self)
        }
        .store(in: &cancellable)
    }
}
