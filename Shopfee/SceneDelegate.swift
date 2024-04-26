//
//  SceneDelegate.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        ShopfeeCoordinator.shared.makeWindow(from: windowScene)
    }
}
