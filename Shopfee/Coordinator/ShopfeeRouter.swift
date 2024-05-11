//
//  ShopfeeRouter.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.

import UIKit
import Coordinator

final public class ShopfeeRouter: Router {
    
    public required override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let backButtonImage = UIImage(systemName: "arrow.left")

        navigationController.navigationBar.backIndicatorImage = backButtonImage
        navigationController.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        navigationController.navigationBar.tintColor = .textHeading
    }
    
    public override func push(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        self.navigationController.topViewController?.navigationItem.backButtonTitle = ""
        super.push(viewController, animated: animated, completion: completion)
    }
}
