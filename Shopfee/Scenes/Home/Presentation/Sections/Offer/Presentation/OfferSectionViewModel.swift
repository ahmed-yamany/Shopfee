//
//  OfferSectionViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation

protocol OfferSectionViewModelProtocol: CompositionalLayoutableSectionViewModel where ItemType == OfferCellModel {
    var reloadData: Action { get set }
}

final class OfferSectionViewModel: OfferSectionViewModelProtocol {
    
    var items: [OfferCellModel] = [] {
        didSet {
            reloadData()
        }
    }
    var reloadData: Action = {}
    
    let useCase: OfferSectionUseCaseProtocol
    init(useCase: OfferSectionUseCaseProtocol) {
        self.useCase = useCase
        fetchData()
    }
    
    func itemsCount() -> Int {
        items.count
    }
    
    func item(at indexPath: IndexPath) -> OfferCellModel? {
        items[safe: indexPath.item]
    }
    
    func fetchData() {
        Task {
            do {
                try await Task.sleep(for: .seconds(2))
                items = try await useCase.getOffers()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
