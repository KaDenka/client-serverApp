//
//  LikeUIControl.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 18.04.2021.
//

import UIKit

enum LikeButtonState {
    case like
    case dislike
}

@IBDesignable class LikeUIControl: UIControl {
    
    private var stackView: UIStackView!
    var likeState: LikeButtonState = .dislike
    let heartButton = UIButton(type: .system)
    let likeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.backgroundColor = UIColor.clear
        heartButton.tintColor = UIColor.blue
        heartButton.addTarget(self, action: #selector(pushLike(_:)), for: .touchUpInside)
        likeLabel.backgroundColor = UIColor.clear
        likeLabel.textColor = UIColor.blue
        likeLabel.text = "0"
        stackView = UIStackView(arrangedSubviews: [likeLabel, heartButton])
        self.addSubview(stackView)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.frame.size = CGSize(width: 60, height: 40)
    }
    
    @objc private func pushLike(_ sender: UIButton) {
        if likeState == .dislike {
            
            UIView.transition(with: heartButton, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.heartButton.tintColor = UIColor.red
            }, completion: nil)
            
            UIView.transition(with: likeLabel, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.likeLabel.textColor = UIColor.red
                self.likeLabel.text = "1"
            }, completion: nil)
            
            likeState = .like
            
        } else {
            
            UIView.transition(with: heartButton, duration: 0.5, options: .transitionFlipFromRight, animations: {
                self.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
                self.heartButton.tintColor = UIColor.blue
            }, completion: nil)
            
            UIView.transition(with: likeLabel, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.likeLabel.textColor = UIColor.blue
                self.likeLabel.text = "0"
            }, completion: nil)
            
            likeState = .dislike
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
}
