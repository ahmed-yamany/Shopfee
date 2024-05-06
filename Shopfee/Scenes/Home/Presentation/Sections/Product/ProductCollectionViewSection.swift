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
    typealias ItemsType = ProductCellModel
    typealias CellType = ProductCollectionViewCell
    // typealias TopSupplementaryViewType = UICollectionReusableView
    // typealias DecorationViewType = UICollectionReusableView
    
    var items: [ItemsType] = [] {
        didSet {
            reloadData()
        }
    }
    
    override init() {
        super.init()
        delegate = self
        dataSource = self
        sectionLayout = self
    }
}
// MARK: - Product CollectionView Section Data Source
extension ProductCollectionViewSection: CompositionalLayoutableSectionDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CellType.self, for: indexPath)
        if let product = items[safe: indexPath.item] {
            cell.configure(with: product)
        } else {
            Logger.log("Failed to get product at \(indexPath.description)", category: \.default, level: .error)
        }
        return cell
    }
    
    /*
     // view For Supplementary Element Of Kind
     func collectionView(_ collectionView: UICollectionView,
     viewForSupplementaryElementOfKind kind: String,
     at indexPath: IndexPath) -> UICollectionReusableView {
     let view = collectionView.dequeueReusableSupplementaryView(TopSupplementaryViewType.self,
     ofKind: TopSupplementaryViewType.identifier,
     for: indexPath)
     <#code#>
     return view
     }
     */
}
// MARK: - Product CollectionView Section Layout
extension ProductCollectionViewSection: CompositionalLayoutableSectionLayout {
    
    var configuration: UICollectionLayoutListConfiguration {
        var configuration = UICollectionLayoutListConfiguration(appearance: .sidebarPlain)
        configuration.showsSeparators = false
        configuration.backgroundColor = .neutralLight
        return configuration
    }
    
    func sectionLayout(at index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
        
        // section.boundarySupplementaryItems = [topSupplementaryItem]
        // let decorationItem = NSCollectionLayoutDecorationItem.background(elementKind: DecorationViewType.identifier)
        // section.decorationItems = [decorationItem]
        return section
    }
}
// MARK: - Product CollectionView Section Delegate
extension ProductCollectionViewSection: CompositionalLayoutableSectionDelegate {
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.register(CellType.self)
    }
    
    /*
     /**
      Registers the supplementary view types
      - Note: you can register here more supplementary views for the section by changing 'supplementaryViewOfKind'
      */
     func registerSupplementaryView(_ collectionView: UICollectionView) {
     collectionView.register(TopSupplementaryViewType.self, supplementaryViewOfKind: TopSupplementaryViewType.identifier)
     }
     */
    
    /*
     /// Registers the Decoration view for the secition
     func registerDecorationView(_ layout: UICollectionViewCompositionalLayout) {
     layout.register(DecorationViewType.self, forDecorationViewOfKind: DecorationViewType.identifier)
     }
     */
    
    /*
     ///
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     }
     */
}

// MARK: - Private Handelers
extension ProductCollectionViewSection {
    /*
     private var topSupplementaryItem: NSCollectionLayoutBoundarySupplementaryItem {
     let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
     return  NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementarySize,
     elementKind: TopSupplementaryViewType.identifier,
     alignment: .top)
     }
     */
}
