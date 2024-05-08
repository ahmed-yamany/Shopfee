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

// swiftlint: disable line_length
protocol ProductSectionViewModelProtocol: CompositionalLayoutableSectionViewModel, ProductSectionHeaderProtocol where ItemType == ProductCellModel {
    var reloadData: Action { get set }
    func prefetchItems(at indexPaths: [IndexPath])
}
// swiftlint: enable line_length

protocol ProductSectionHeaderProtocol: ObservableObject {
    var drinkTypes: [String] { get set }
    var selectedDrinkType: String { get set }
}

final class ProductSectionViewModel: ProductSectionViewModelProtocol {
    @Published var drinkTypes: [String] = ["Coffee", "Non Coffee", "Pastry"]
    @Published var selectedDrinkType: String = "Coffee"
    
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
