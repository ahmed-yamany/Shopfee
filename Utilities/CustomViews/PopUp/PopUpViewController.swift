//
//  PopUpViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 30/04/2024.
//

import SwiftUI

final class PopUpViewController: UIHostingController<PopUpView> {
    
    let transitionDelegate = PopUpTransitioningDelegate()
    
    init(_ item: any PopUpItem, onPrimaryAction: @escaping Action, onSecondaryAction: @escaping Action) {
        super.init(rootView: PopUpView(item, onPrimaryAction: onPrimaryAction, onSecondaryAction: onSecondaryAction))
        view.backgroundColor = .clear
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Coordinator {
    func showPopUp(item: any PopUpItem, onPrimaryAction: @escaping Action, onSecondaryAction: @escaping Action) {
        let controller = PopUpViewController(item, onPrimaryAction: onPrimaryAction, onSecondaryAction: onSecondaryAction)
        router.present(controller, transitioningDelegate: controller.transitionDelegate)
    }
}
