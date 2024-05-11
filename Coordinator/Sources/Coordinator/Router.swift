//
//  Router.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.

import UIKit

@MainActor
open class Router {
    public let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    open var navigationBarIsHidden: Bool {
        get { navigationController.navigationBar.isHidden }
        set { navigationController.navigationBar.isHidden = newValue }
    }
    
    open func present(
        _ viewController: UIViewController,
        animated: Bool = true,
        presentationStyle: UIModalPresentationStyle = .automatic,
        transitionStyle: UIModalTransitionStyle = .coverVertical,
        completion: @escaping () -> Void = {}
    ) {
        viewController.modalPresentationStyle = presentationStyle
        viewController.modalTransitionStyle = transitionStyle
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    open func present(
        _ viewController: UIViewController,
        transitioningDelegate: UIViewControllerTransitioningDelegate,
        completion: @escaping () -> Void = {}
    ) {
        viewController.transitioningDelegate = transitioningDelegate
        present(viewController, animated: true, presentationStyle: .overFullScreen)
    }
    
    open func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        if navigationController.presentedViewController != nil {
            navigationController.dismiss(animated: animated, completion: completion)
        } else {
            navigationController.popViewController(animated: animated)
            completion()
        }
    }
    
    open func push(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.dismiss(animated: false)
        navigationController.pushViewController(viewController, animated: animated)
        completion()
    }
    
    open func reset(completion: @escaping () -> Void = {}) {
        navigationController.dismiss(animated: false)
        navigationController.viewControllers.removeAll()
    }
    
    open func popToViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.popToViewController(viewController, animated: animated)
        completion()
    }
    
    open func popToRoot(animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.popToRootViewController(animated: animated)
        completion()
    }
    
    open func navigationTitle(_ title: String) {
        navigationController.visibleViewController?.navigationItem.title = title
    }
    
    open func setViewControllers(_ viewControllers: [UIViewController], animated: Bool = true) {
        navigationController.dismiss(animated: false)
        navigationController.setViewControllers(viewControllers, animated: animated)
    }
    
    open func setViewController(_ viewController: UIViewController, animated: Bool = true) {
        self.setViewControllers([viewController], animated: animated)
    }
}
