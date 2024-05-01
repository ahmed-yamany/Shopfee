//
//  PopUpTransitioningDelegate.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 01/05/2024.
//

import Foundation

import UIKit
import MakeConstraints

class PopUpTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    public func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return PopUpPresentAnimator(presented: presented)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        nil
    }
}

class PopUpPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let presented: UIViewController
    
    init(presented: UIViewController) {
        self.presented = presented
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard  let toView = transitionContext.view(forKey: .to) else {
            return
        }
        
        transitionContext.containerView.addSubview(toView)
        toView.frame = .init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 0)
        toView.layer.masksToBounds = true
        toView.fillSuperview()
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1) {
            toView.layoutIfNeeded()
        } completion: { _ in
            transitionContext.completeTransition(true)
        }
    }
}
