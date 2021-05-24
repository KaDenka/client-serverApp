//
//  CustomPushAnimator.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 05.05.2021.
//

import UIKit

class CustomPushAnimator: NSObject {
    
}

extension CustomPushAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else {return}
        
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = CGRect(x: source.view.frame.size.width / 2, y: 0, width: source.view.frame.width, height: source.view.frame.height)
        
        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        destination.view.transform = CATransform3DGetAffineTransform(CATransform3DMakeRotation(.pi/2.1, 0, 1, 0))
        
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModeCubicPaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        destination.view.transform = CATransform3DGetAffineTransform(CATransform3DMakeRotation(.pi/2, 0, 0, 0))
                                                       })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        destination.view.transform = .identity
                                                       })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.4,
                                                       relativeDuration: 0.6,
                                                       animations: {
                                                        let translation = CGAffineTransform(translationX: -200, y: 0)
                                                        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                                        source.view.transform = translation.concatenating(scale)
                                                       })
                                    
                                },
                                completion: {finished in
                                    let tempFlag = finished && (!transitionContext.transitionWasCancelled)
                                    if tempFlag {
                                        source.view.transform = .identity
                                    }
                                    transitionContext.completeTransition(tempFlag)
                                })
    }
}
