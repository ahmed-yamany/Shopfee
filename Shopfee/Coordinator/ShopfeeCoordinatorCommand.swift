//
//  ShopfeeCoordinatorCommand.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import UIKit

struct ShopfeeCoordinatorCommand: SceneDelegateCommand {
    let scene: UIScene
    
    func execute() {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        ShopfeeCoordinator.shared.makeWindow(from: windowScene)
    }
}
