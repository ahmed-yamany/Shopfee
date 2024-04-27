//
//  Router.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.

import UIKit

@MainActor
public protocol Router: AnyObject {
    var navigationController: UINavigationController { get }
}

public extension Router {
    func present(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    func presentFullScreen(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: animated, completion: completion)
    }
    
    func presentOverFullScreen(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        if navigationController.presentedViewController != nil {
            navigationController.dismiss(animated: animated, completion: completion)
        } else {
            navigationController.popViewController(animated: animated)
            completion()
        }
    }
    
    func push(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.dismiss(animated: false)
        navigationController.pushViewController(viewController, animated: animated)
        completion()
    }
    
    func reset(completion: @escaping () -> Void = {}) {
        navigationController.dismiss(animated: false)
        navigationController.viewControllers.removeAll()
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.popToViewController(viewController, animated: animated)
        completion()
    }
    
    func popToRoot(animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.popToRootViewController(animated: animated)
        completion()
    }
    
    func navigationTitle(_ title: String) {
        navigationController.visibleViewController?.navigationItem.title = title
    }
    
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool = true) {
        navigationController.setViewControllers(viewControllers, animated: animated)
    }
    
    func setViewController(_ viewController: UIViewController, animated: Bool = true) {
        self.setViewControllers([viewController], animated: animated)
    }
}
