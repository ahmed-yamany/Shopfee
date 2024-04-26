//
//  ShopfeeRouter.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.

import UIKit

final public class ShopfeeRouter: Router {
    public let navigationController: UINavigationController
    
    public required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
