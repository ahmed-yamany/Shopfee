//
//  Coordinator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.

import Foundation

protocol Coordinator: AnyObject {
    var router: Router { get }    
    func start()
}

extension Coordinator {
    func navigationTitle(_ title: String) {
        router.navigationTitle(title)
    }
    
    func dismiss(animated: Bool = true, _ completion: @escaping Action = {}) {
        router.dismiss(animated: animated, completion: completion)
    }
}
