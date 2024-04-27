//
//  OpenFromCenterPresentAnimator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 27/04/2024.
//

import UIKit
import MakeConstraints

class OpenFromCenterTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    public func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return OpenFromCenterPresentAnimator()
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        nil
    }
}

class OpenFromCenterPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard  let fromView = transitionContext.view(forKey: .from) else {
            return
        }
        guard  let toView = transitionContext.view(forKey: .to) else {
            return
        }
                
        toView.frame = .init(x: 0, y: 0, width: 0, height: fromView.frame.height)
        toView.layer.masksToBounds = true
        toView.layer.cornerRadius = 8
    
        transitionContext.containerView.addSubview(toView)
        toView.fillSuperview()
        
        UIView.animate(withDuration: 1) {
            toView.layoutIfNeeded()
        } completion: { _ in
            transitionContext.completeTransition(true)
        }
    }
}
