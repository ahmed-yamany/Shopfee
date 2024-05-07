//
//  Offer.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 05/05/2024.
//

import CompositionalLayoutableSection
import FoundationExtensions
import UIKit

// MARK: - A custom section for displaying Offer in a collection view.
final class OfferCollectionViewSection: CompositionalLayoutableSection {
    typealias ItemsType = OfferCellModel
    typealias CellType = OfferCollectionViewCell
    typealias DecorationViewType = PaginationSupplementaryView
    typealias SupplementaryViewType = PaginationSupplementaryView
    
    var supplementaryView: SupplementaryViewType?
    
    @MainActor var items: [ItemsType] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    override init() {
        super.init()
        delegate = self
        dataSource = self
        sectionLayout = self
    }
}

// MARK: - Offer CollectionView Section Data Source

extension OfferCollectionViewSection: UICompositionalLayoutableSectionDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CellType.self, for: indexPath)
        if let offer = items[safe: indexPath.item] {
            cell.configure(with: offer)
        } else {
            Logger.log("Failed to get offer at indexPath \(indexPath.description)", category: \.default, level: .fault)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(SupplementaryViewType.self,
                                                                                ofKind: SupplementaryViewType.identifier,
                                                                                for: indexPath)
        self.supplementaryView = supplementaryView
        supplementaryView.setCount(items.count)
        return supplementaryView
    }
}

// MARK: - Offer CollectionView Section Layout

extension OfferCollectionViewSection: UICompositionalLayoutableSectionLayout {
    var height: CGFloat { 140 } // group height
    
    var itemLayoutInGroup: NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        return item
    }
    
    var groupLayoutInSection: NSCollectionLayoutGroup {
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [itemLayoutInGroup])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return group
    }
    
    var paginationSupplementaryItem: NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .estimated(1), heightDimension: .absolute(40))
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: size,
            elementKind: SupplementaryViewType.identifier,
            containerAnchor: .init(edges: [.bottom])
        )
    }
    
    func sectionLayout(at index: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: groupLayoutInSection)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        section.boundarySupplementaryItems = [paginationSupplementaryItem]
        section.visibleItemsInvalidationHandler = visibleItemsInvalidationHandler
        return section
    }
    
    var visibleItemsInvalidationHandler: NSCollectionLayoutSectionVisibleItemsInvalidationHandler {
        { [weak self] items, _, _ in
            guard let self = self else {
                Logger.log("Self is nil", category: \.default, level: .info)
                return
            }
            
            guard let supplementaryView else {
                Logger.log("supplementaryView is nil", category: \.default, level: .error)
                return
            }
            
            supplementaryView.updateIndex(to: items.last?.indexPath.item ?? 0)
        }
    }
}

// MARK: - Offer CollectionView Section Delegate

extension OfferCollectionViewSection: UICompositionalLayoutableSectionDelegate {
    func registerCell(in collectionView: UICollectionView) {
        collectionView.register(CellType.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(SupplementaryViewType.self, supplementaryViewOfKind: SupplementaryViewType.identifier)
    }
    
    func registerDecorationView(in layout: UICollectionViewCompositionalLayout) {
        layout.register(DecorationViewType.self, forDecorationViewOfKind: DecorationViewType.identifier)
    }
}

// MARK: - Private Methods

private extension OfferCollectionViewSection {}
