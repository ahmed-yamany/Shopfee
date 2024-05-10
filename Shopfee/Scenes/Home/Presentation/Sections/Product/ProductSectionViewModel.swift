//
//  ProductSectionViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation
import FoundationExtensions

@MainActor
protocol CompositionalLayoutableSectionViewModel: ObservableObject {
    associatedtype ItemType
    var items: [ItemType] { get set}
    
    func itemsCount() -> Int
    func item(at indexPath: IndexPath) -> ItemType?
}

protocol ProductSectionHeaderProtocol: ObservableObject {
    var drinkTypes: [String] { get set }
    var selectedDrinkType: String { get set }
    var filterItems: [FilterPickerItem] { get set }
    var selectedFilterTypes: [FilterPickerItem] { get set }
}

// swiftlint: disable line_length
protocol ProductSectionViewModelProtocol: CompositionalLayoutableSectionViewModel, ProductSectionHeaderProtocol where ItemType == ProductCellModel {
    var reloadData: Action { get set }
    func prefetchItems(at indexPaths: [IndexPath])
    func didSelectItemAt(_ indexPath: IndexPath)
}
// swiftlint: enable line_length

final class ProductSectionViewModel: ProductSectionViewModelProtocol {
    @Published var drinkTypes: [String] = []
    @Published var selectedDrinkType: String = "Coffee"
    @Published var filterItems: [FilterPickerItem] = []
    @Published var selectedFilterTypes: [FilterPickerItem] = []
    
    @MainActor 
    var items: [ItemType] = [] {
        didSet {
            reloadData()
        }
    }
    
    var reloadData: Action = {}
    
    let coordinator: ProductSectionCoordinatorProtocol
    let useCase: ProductSectionUseCaseProtocol
    
    init(coordinator: ProductSectionCoordinatorProtocol, useCase: ProductSectionUseCaseProtocol) {
        self.useCase = useCase
        self.coordinator = coordinator
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
                drinkTypes = try await useCase.getDrinkTypes()
                filterItems = try await useCase.getFilterPickerItems()
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
    
    func didSelectItemAt(_ indexPath: IndexPath) {
        guard let product = items[safe: indexPath.item] else {
            Logger.log("Failed to get item at \(indexPath)", category: \.default, level: .error)
            return
        }
        coordinator.showDetails(for: product)
    }
}
