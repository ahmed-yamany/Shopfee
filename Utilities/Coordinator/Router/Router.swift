//
//  Router.swift
//  Grocer
//
//  Created by Ahmed Yamany on 01/1/2023.
//

import UIKit

public protocol Router: AnyObject {
    var navigationController: UINavigationController { get }
}

public extension Router {
    func present(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            navigationController.present(viewController, animated: animated, completion: completion)
        }
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
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if navigationController.presentedViewController != nil {
                navigationController.dismiss(animated: animated, completion: completion)
            } else {
                navigationController.popViewController(animated: animated)
                completion()
            }
        }
    }
    
    func push(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            navigationController.dismiss(animated: false)
            navigationController.pushViewController(viewController, animated: animated)
            completion()
        }
    }
    
    func reset(completion: @escaping () -> Void) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            navigationController.dismiss(animated: false)
            navigationController.viewControllers.removeAll()
        }
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            navigationController.popToViewController(viewController, animated: animated)
            completion()
        }
    }
    
    func popToRoot(animated: Bool = true, completion: @escaping () -> Void = {}) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            navigationController.popToRootViewController(animated: animated)
            completion()
        }
    }
    
    func navigationTitle(_ title: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            navigationController.visibleViewController?.navigationItem.title = title
        }
    }
    
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            navigationController.setViewControllers(viewControllers, animated: animated)
        }
    }
    
    func setViewController(_ viewController: UIViewController, animated: Bool = true) {
        self.setViewControllers([viewController], animated: animated)
    }
}
