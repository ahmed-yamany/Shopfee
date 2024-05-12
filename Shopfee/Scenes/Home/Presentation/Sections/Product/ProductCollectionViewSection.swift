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
    typealias HeaderViewType = ProductSectionHeader
    
    private let viewModel: any ProductSectionViewModelProtocol
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(HeaderViewType.self, ofKind: HeaderViewType.identifier,
                                                                                for: indexPath)
        supplementaryView.configure(with: viewModel)
        return supplementaryView
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
    private var itemLayoutInGroup: NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
    
    private var groupLayoutInSection: NSCollectionLayoutGroup {
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(85))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [itemLayoutInGroup])
        group.contentInsets = .init(top: 0, leading: .safeAreaPadding, bottom: 0, trailing: .safeAreaPadding)
        return group
    }
    
    private var headerSupplementaryItem: NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90))
        let item =  NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size, elementKind: HeaderViewType.identifier, alignment: .top)
        item.pinToVisibleBounds = true
        return item
    }
    
    func sectionLayout(at index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: groupLayoutInSection)
        section.boundarySupplementaryItems = [headerSupplementaryItem]
        section.interGroupSpacing = 8
        return section
    }
}

// MARK: - Product CollectionView Section Delegate
extension ProductCollectionViewSection: UICompositionalLayoutableSectionDelegate {
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.register(CellType.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(HeaderViewType.self, supplementaryViewOfKind: HeaderViewType.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath)
    }
}
