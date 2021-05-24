//
//  CustomNavigationController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 05.05.2021.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        // Do any additional setup after loading the view.
    }
    
    let interactiveTransition = CustomInteractiveTransition()
    
}



extension CustomNavigationController: UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            self.interactiveTransition.viewController = toVC
            return CustomPushAnimator()
            
        }
        else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            return CustomPopAnimator()
        }
        
        return nil
        
        
        
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    
    
    
    
}
