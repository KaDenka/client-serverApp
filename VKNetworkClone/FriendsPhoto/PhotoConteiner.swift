//
//  PhotoConteiner.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 30.04.2021.
//

import UIKit

@IBDesignable class PhotoConteiner: UIView {
    
    
    @IBInspectable var inacPageIndicatorColor = UIColor.lightGray
    @IBInspectable var activePageIndicatorColor = #colorLiteral(red: 0.1648246646, green: 0.40975371, blue: 0.5832718015, alpha: 1)
    
    private var view: UIView?
    private var mainView = UIImageView()
    private var secondaryView = UIImageView()
    private var pageConrtol = UIPageControl()
    private var images = [UIImage]()
    private var currentIndex = 0
    private var photoViewAnimator: UIViewPropertyAnimator!
    private var isLeftSwipe = false
    private var isRightSwipe = false
    private var chooseFlag = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PhotoConteiner", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
        return view
    }
    
    private func setup() {
        view = loadFromNib()
        guard let view = view else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.addGestureRecognizer(recognizer)
        
        mainView.backgroundColor = #colorLiteral(red: 0.2233942747, green: 0.571577847, blue: 0.8191457391, alpha: 1)
        mainView.frame = self.bounds
        mainView.contentMode = .scaleToFill
        addSubview(mainView)
        
        secondaryView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        secondaryView.frame = self.bounds
        secondaryView.contentMode = .scaleToFill
        secondaryView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        addSubview(secondaryView)
        
        pageConrtol.backgroundColor = UIColor.clear
        pageConrtol.frame = CGRect(x: 1, y: 1, width: 150, height: 50)
        pageConrtol.layer.zPosition = 100
        pageConrtol.numberOfPages = 1
        pageConrtol.currentPage = 0
        pageConrtol.pageIndicatorTintColor = self.inacPageIndicatorColor
        pageConrtol.currentPageIndicatorTintColor = self.activePageIndicatorColor
        addSubview(pageConrtol)
        pageConrtol.translatesAutoresizingMaskIntoConstraints = false
        pageConrtol.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pageConrtol.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height / 5).isActive = true
        pageConrtol.isUserInteractionEnabled = false
        
    }
    
    private func onChange(isLeft: Bool) {
        self.mainView.transform = .identity
        self.secondaryView.transform = .identity
        self.mainView.image = images[currentIndex]
        
        if isLeft {
            self.mainView.layer.zPosition = 50
            
            self.secondaryView.image = images[self.currentIndex + 1]
            self.secondaryView.layer.zPosition = 100
            self.secondaryView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        }
        else {
            self.secondaryView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.secondaryView.layer.zPosition = 50
            self.secondaryView.image = images[currentIndex - 1]
        }
    }
    
    private func onChangeCompletion(isLeft: Bool) {
        self.mainView.transform = .identity
        self.secondaryView.transform = .identity
        if isLeft {
            self.currentIndex += 1
        }
        else {
            self.currentIndex -= 1
        }
        self.mainView.image = self.images[self.currentIndex]
        self.bringSubviewToFront(self.mainView)
        self.pageConrtol.currentPage = self.currentIndex
    }
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        
        if let animator = photoViewAnimator,
           animator.isRunning {
            return
        }
        
        switch recognizer.state {
        
        case .began:
            
            self.mainView.transform = .identity
            self.mainView.image = images[currentIndex]
            self.secondaryView.transform = .identity
            self.bringSubviewToFront(self.mainView)
            
            photoViewAnimator?.startAnimation()
            photoViewAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                       curve: .easeInOut,
                                                       animations: { [weak self] in
                                                        self?.mainView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                                                       })
            photoViewAnimator.pauseAnimation()
            isLeftSwipe = false
            isRightSwipe = false
            chooseFlag = false
            
        case .changed:
            
            var translation = recognizer.translation(in: self.view)
            
            if translation.x < 0 && (!isLeftSwipe) && (!chooseFlag) {
                if self.currentIndex == (images.count - 1) {
                    photoViewAnimator.stopAnimation(true)
                    return
                }
                chooseFlag = true
                onChange(isLeft: true)
                
                
                photoViewAnimator.stopAnimation(true)
                photoViewAnimator.addAnimations { [weak self] in
                    self?.mainView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    self?.secondaryView.transform = .identity
                }
                photoViewAnimator.addCompletion({ [weak self] _ in
                    self?.onChangeCompletion(isLeft: true)
                })
                
                photoViewAnimator.startAnimation()
                photoViewAnimator.pauseAnimation()
                isLeftSwipe = true
            }
            
            if translation.x > 0 && (!isRightSwipe) && (!chooseFlag) {
                if self.currentIndex == 0 {
                    photoViewAnimator.stopAnimation(true)
                    return
                }
                chooseFlag = true
                onChange(isLeft: false)
                photoViewAnimator.stopAnimation(true)
                photoViewAnimator.addAnimations { [weak self] in
                    
                    self?.mainView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                    self?.secondaryView.transform = .identity
                }
                photoViewAnimator.addCompletion({ [weak self] _ in
                    self?.onChangeCompletion(isLeft: false)
                })
                photoViewAnimator.startAnimation()
                photoViewAnimator.pauseAnimation()
                isRightSwipe = true
            }
            
            if isRightSwipe && (translation.x < 0) {return}
            if isLeftSwipe && (translation.x > 0) {return}
            
            if translation.x < 0 {
                translation.x = -translation.x
            }
            photoViewAnimator.fractionComplete = translation.x / (UIScreen.main.bounds.width)
            
        case .ended:
            
            if let animator = photoViewAnimator,
               animator.isRunning {
                return
            }
            var translation = recognizer.translation(in: self.view)
            
            if translation.x < 0 {translation.x = -translation.x}
            
            if (translation.x / (UIScreen.main.bounds.width)) > 0.5  {
                photoViewAnimator.startAnimation()
            }
            else {
                photoViewAnimator.stopAnimation(true)
                photoViewAnimator.finishAnimation(at: .start)
                
                photoViewAnimator.addAnimations { [weak self] in
                    self?.mainView.transform = .identity
                    guard let weakSelf = self else {return}
                    if weakSelf.isLeftSwipe {
                        self?.secondaryView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                    }
                    if weakSelf.isRightSwipe {
                        self?.secondaryView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    }
                }
                
                photoViewAnimator.addCompletion({ [weak self] _ in
                    self?.mainView.transform = .identity
                    self?.secondaryView.transform = .identity
                    self?.mainView.layer.zPosition = 100
                    self?.secondaryView.layer.zPosition = 50
                })
                
                photoViewAnimator.startAnimation()
                
            }
        default:
            return
        }
    }
    
    func setImages(images: [UIImage]) {
        self.images = images
        if self.images.count > 0 {
            self.mainView.image = self.images.first
        }
        pageConrtol.numberOfPages = self.images.count
    }
}
