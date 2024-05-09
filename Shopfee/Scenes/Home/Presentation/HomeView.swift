//
//  HomeView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 04/05/2024.
//

import CompositionalLayoutableSection
import CustomViews
import Combine
import SwiftUI

final class HomeView: UICollectionView, CompositionalLayoutProvider {
    
    var compositionalLayoutSections: [CompositionalLayoutableSection] = []
    var cancellable: Set<AnyCancellable> = []
    
    lazy var compositionalDelegate = CompositionalLayoutDelegate(provider: self)
    lazy var compositionalDataSource = CompositionalLayoutDataSource(provider: self, configuration: self)
    lazy var compositionalDataSourcePrefetching = CompositionalLayoutDataSourcePrefetching(provider: self)
    let compositionalLayoutConfigurations = UICollectionViewCompositionalLayoutConfiguration()
    
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
    private var headerSupplementaryItem: NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let item =  NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size,
                                                                elementKind: SearchSupplementaryView.identifier,
                                                                alignment: .top)
        item.pinToVisibleBounds = true
        return item
    }
    
    func configureLayout() {
        backgroundColor = .neutralLight
        delegate = compositionalDelegate
        dataSource = compositionalDataSource
        prefetchDataSource = compositionalDataSourcePrefetching
        updateConfigurations()
        bindViewModel()
    }
    
    func updateConfigurations() {
        register(SearchSupplementaryView.self, supplementaryViewOfKind: SearchSupplementaryView.identifier)
        compositionalLayoutConfigurations.interSectionSpacing = 16
        compositionalLayoutConfigurations.boundarySupplementaryItems = [headerSupplementaryItem]
    }
    
    func bindViewModel() {
        bindSections()
    }
    
    func bindSections() {
        viewModel.compositionalLayoutSectionsPublisher.sink {[weak self] sections in
            guard let self = self else { return }
            compositionalLayoutSections = sections
            updateCompositionalLayout(for: self, configurations: compositionalLayoutConfigurations)
        }
        .store(in: &cancellable)
    }
}

extension HomeView: CompositionalLayoutDataSourceConfiguration {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(SearchSupplementaryView.self,
                                                                                ofKind: SearchSupplementaryView.identifier,
                                                                                for: indexPath)
        supplementaryView.configure(with: searchTextBinding, placeholder: viewModel.searchPlaceholder)
        return supplementaryView
    }
    
    var searchTextBinding: Binding<String> {
        Binding(
            get: { [weak self] in self?.viewModel.searchText ?? "" },
            set: { [weak self] in self?.viewModel.searchText = $0 }
        )
    }
}
