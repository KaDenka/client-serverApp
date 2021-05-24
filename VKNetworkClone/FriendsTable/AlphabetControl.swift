//
//  AlphabetControl.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 19.04.2021.
//

import UIKit

protocol AlphabetControlDelegate: AnyObject {
    func buttonPushed(index: IndexPath)
}


@IBDesignable class AlphabetControl: UIControl {
    
    var stackView: UIStackView!
    
    var buttonsArray = [UIButton]()
    
    var lettersArray = [Character]()
    
    weak var delegate: AlphabetControlDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    func letterArrayForming() {
        for user in usersDictionary {
            lettersArray.append(user.key.uppercased().first!)
        }
        lettersArray.sort()
    }
    
    private func setupView() {
        
        letterArrayForming()
        
        for letter in lettersArray {
            let button = UIButton(type: .system)
            button.setTitle(String(letter), for: .normal)
            button.setTitleColor(#colorLiteral(red: 0.2099580467, green: 0.4934020638, blue: 0.6537715793, alpha: 1), for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.backgroundColor = UIColor.clear
            button.frame.size.width = self.bounds.width
            button.frame.size.height = button.frame.size.width
            button.addTarget(self, action: #selector(selectLetter(_:)), for: .touchUpInside)
            self.buttonsArray.append(button)
            
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttonsArray)
        self.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 2

    }
    
    @objc private func selectLetter(_ sender: UIButton) {
        guard self.buttonsArray.firstIndex(of: sender) != nil else { return }
        let indexPath = IndexPath(row: 0, section: Int(buttonsArray.firstIndex(of: sender)!))
        delegate?.buttonPushed(index: indexPath)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        // Do any additional setup after loading the view.
    //    }
    
    
    
    
    
    
}
