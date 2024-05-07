//
//  ProductCollectionViewSection.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 06/05/2024.
//

import UIKit
import FoundationExtensions
import CompositionalLayoutableSection

// MARK: - A custom section for displaying Product in a collection view.
class ProductCollectionViewSection: CompositionalLayoutableSection {
    typealias CellType = ProductCollectionViewCell
    typealias TopSupplementaryViewType = PaginationSupplementaryView
    
    let viewModel: any ProductSectionViewModelProtocol
    init(viewModel: any ProductSectionViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
        delegate = self
        dataSource = self
        sectionLayout = self
        prefetchDataSource = self
        
        viewModel.reloadData = { [weak self] in
            self?.reloadData()
        }
    }
}

// MARK: - Product CollectionView Section Data Source
extension ProductCollectionViewSection: UICompositionalLayoutableSectionDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CellType.self, for: indexPath)
        if let product = viewModel.item(at: indexPath) {
            cell.configure(with: product)
            viewModel.prefetchItems(at: [indexPath])
        } else {
            Logger.log("Failed to get product at \(indexPath.description)", category: \.default, level: .error)
        }
        return cell
    }
}

// MARK: - Product CollectionView Section Data Source Prefetching
extension ProductCollectionViewSection: UICompositionalLayoutableSectionDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        viewModel.prefetchItems(at: indexPaths)
    }
}

// MARK: - Product CollectionView Section Layout
extension ProductCollectionViewSection: UICompositionalLayoutableSectionLayout {
    
    var configuration: UICollectionLayoutListConfiguration {
        var configuration = UICollectionLayoutListConfiguration(appearance: .sidebarPlain)
        configuration.showsSeparators = false
        configuration.backgroundColor = .neutralLight
        return configuration
    }
    
    func sectionLayout(at index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
        section.boundarySupplementaryItems = []
        return section
    }
}

// MARK: - Product CollectionView Section Delegate
extension ProductCollectionViewSection: UICompositionalLayoutableSectionDelegate {
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.register(CellType.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {

    }
}
