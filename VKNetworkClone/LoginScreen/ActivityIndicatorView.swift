//
//  ActivityIndicatorView.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 29.04.2021.
//

import UIKit

class ActivityIndicatorView: UIView {
    private var activityView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ActivityIndicatorView", bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return UIView()}
        
        return view
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configActivity()
    }
    
    func setup() {
        activityView = loadFromNib()
        guard let view = activityView else {return}
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
    }
    
    let firstCircleLayer = CAShapeLayer()
    let secondCircleLayer = CAShapeLayer()
    let firdCircleLayer = CAShapeLayer()
    var circleLayersArray = [CAShapeLayer]()
    
    func configActivity(){
        
        circleLayersArray = [firstCircleLayer, secondCircleLayer, firdCircleLayer]
        
        if let view = activityView {
            for circle in circleLayersArray {
                circle.backgroundColor = #colorLiteral(red: 0.1648246646, green: 0.40975371, blue: 0.5832718015, alpha: 1)
                circle.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
                circle.cornerRadius = 5
            }
            
            firstCircleLayer.position = CGPoint(x: view.center.x - 50, y: view.center.y)
            secondCircleLayer.position = CGPoint(x: view.center.x, y: view.center.y)
            firdCircleLayer.position = CGPoint(x: view.center.x + 50, y: view.center.y)
            
            view.layer.addSublayer(firstCircleLayer)
            view.layer.addSublayer(secondCircleLayer)
            view.layer.addSublayer(firdCircleLayer)
        }
        
    }
    
    
    func animation() {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.beginTime = CACurrentMediaTime() + 0
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1
        animation.autoreverses = true
        animation.repeatCount = 6
        firstCircleLayer.add(animation, forKey: nil)
        
        animation.beginTime = CACurrentMediaTime() + 0.33
        secondCircleLayer.add(animation, forKey: nil)
        
        animation.beginTime = CACurrentMediaTime() + 0.66
        firdCircleLayer.add(animation, forKey: nil)
    }
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
