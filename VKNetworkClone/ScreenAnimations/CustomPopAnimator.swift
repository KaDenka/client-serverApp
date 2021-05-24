//
//  CustomPopAnimator.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 05.05.2021.
//

import UIKit

class CustomPopAnimator: NSObject {

}

extension CustomPopAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else {return}
   
      
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        destination.view.frame = source.view.frame
        source.view.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        
        let translation = CGAffineTransform(translationX: -200, y: 0)
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        destination.view.transform = translation.concatenating(scale)
        
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModeCubicPaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 1,
                                                       animations: {
                                                        source.view.transform = CATransform3DGetAffineTransform(CATransform3DMakeRotation(.pi/2.1, 0, 1, 0))
                                                       })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        destination.view.transform = .identity
                                                       })
                                    },
                                completion: {finished in
                                    let tempFlag = finished && (!transitionContext.transitionWasCancelled)
                                    if tempFlag {
                                        source.removeFromParent()
                                    }
                                    else if transitionContext.transitionWasCancelled {
                                        destination.view.transform = .identity
                                    }
                                    
                                    transitionContext.completeTransition(tempFlag)
                                })
      }
}
    
