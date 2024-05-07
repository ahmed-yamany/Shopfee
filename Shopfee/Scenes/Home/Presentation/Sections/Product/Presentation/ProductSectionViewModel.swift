//
//  ProductSectionViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation

@MainActor
protocol CompositionalLayoutableSectionViewModel: ObservableObject {
    associatedtype ItemType
    var items: [ItemType] { get set}
    
    func itemsCount() -> Int
    func item(at indexPath: IndexPath) -> ItemType?
}

protocol ProductSectionViewModelProtocol: CompositionalLayoutableSectionViewModel where ItemType == ProductCellModel {
    var reloadData: Action { get set }
    func prefetchItems(at indexPaths: [IndexPath])
}

final class ProductSectionViewModel: ProductSectionViewModelProtocol {
    @MainActor 
    var items: [ItemType] = [] {
        didSet {
            reloadData()
        }
    }
    
    var reloadData: Action = {}
    
    let useCase: ProductSectionUseCaseProtocol
    init(useCase: ProductSectionUseCaseProtocol) {
        self.useCase = useCase
        fetchData()
    }
    
    func itemsCount() -> Int {
        items.count
    }
    
    func item(at indexPath: IndexPath) -> ProductCellModel? {
        items[safe: indexPath.item]
    }
    
    func fetchData() {
        Task {
            do {
                try await Task.sleep(for: .seconds(2))
                items = try await useCase.getProducts()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func prefetchItems(at indexPaths: [IndexPath]) {
        let products = indexPaths.map { $0.item }.map { items[$0] }
        
        Task { @MainActor in
            do {
                for product in products {
                    let image = try await useCase.fetchImage(from: product.imageUrl)
                    product.updateImage(image)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
