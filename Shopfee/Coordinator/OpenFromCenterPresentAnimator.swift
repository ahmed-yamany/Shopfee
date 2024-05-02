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
        return OpenFromCenterPresentAnimator(presented: presented)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        nil
    }
}

class OpenFromCenterPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
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
                
        toView.frame = .init(x: UIScreen.main.bounds.width / 2, y: 0, width: 0, height: UIScreen.main.bounds.height)
        toView.layer.masksToBounds = true
    
        transitionContext.containerView.addSubview(toView)
        toView.fillSuperview()
        
        UIView.animate(withDuration: 1) {
            toView.layoutIfNeeded()
        } completion: { _ in
            transitionContext.completeTransition(true)
        }
    }
}
