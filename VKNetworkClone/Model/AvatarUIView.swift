//
//  AvatarUIView.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 17.04.2021.
//

import UIKit

@IBDesignable
class AvatarUIView: UIView {
    let userImage = UIImageView()
    @IBInspectable var shadowOpasity: Float = 0
    @IBInspectable var shadowRadius: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        
        
        self.addSubview(userImage)
        userImage.frame = self.bounds
        userImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        userImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        userImage.layer.cornerRadius = userImage.frame.size.height / 2
        userImage.clipsToBounds = true
        userImage.backgroundColor = #colorLiteral(red: 0.1648246646, green: 0.40975371, blue: 0.5832718015, alpha: 1)
        self.backgroundColor = UIColor.clear
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.layer.shadowOpacity = shadowOpasity
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        
    }
    
}
