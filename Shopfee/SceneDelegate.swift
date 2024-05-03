//
//  SceneDelegate.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import UIKit

@MainActor
protocol SceneDelegateCommand {
    func execute()
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let commands: [SceneDelegateCommand] = [
            ShopfeeCoordinatorCommand(scene: scene)
        ]
        commands.forEach { $0.execute() }
    }
}
