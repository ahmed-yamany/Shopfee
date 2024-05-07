//
//  ProductCollectionViewSection.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 06/05/2024.
//

import UIKit
import FoundationExtensions
import CompositionalLayoutableSection

protocol ProductCollectionViewSectionDelegate: AnyObject {
    func productCollectionViewSectionDelegate(_ section: ProductCollectionViewSection, prefetchProducts products: [ProductCellModel])
}

// MARK: - A custom section for displaying Product in a collection view.
class ProductCollectionViewSection: CompositionalLayoutableSection {
    typealias ItemsType = ProductCellModel
    typealias CellType = ProductCollectionViewCell
    typealias TopSupplementaryViewType = PaginationSupplementaryView
    
    @MainActor var items: [ItemsType] = [] {
        didSet {
            reloadData()
        }
    }
    
    weak var sectionDelegate: (any ProductCollectionViewSectionDelegate)?
    
    override init() {
        super.init()
        delegate = self
        dataSource = self
        sectionLayout = self
        prefetchDataSource = self
    }
}

// MARK: - Product CollectionView Section Data Source
extension ProductCollectionViewSection: UICompositionalLayoutableSectionDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CellType.self, for: indexPath)
        if let product = items[safe: indexPath.item] {
            cell.configure(with: product)
            sectionDelegate?.productCollectionViewSectionDelegate(self, prefetchProducts: [product])
        } else {
            Logger.log("Failed to get product at \(indexPath.description)", category: \.default, level: .error)
        }
        return cell
    }
}

// MARK: - Product CollectionView Section Data Source Prefetching
extension ProductCollectionViewSection: UICompositionalLayoutableSectionDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let sectionDelegate else {
            Logger.log("sectionDelegate is nil", category: \.default, level: .error)
            return
        }
        let products = indexPaths.map { self.items[$0.item] }
        sectionDelegate.productCollectionViewSectionDelegate(self, prefetchProducts: products)
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
