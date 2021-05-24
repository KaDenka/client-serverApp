//
//  ViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 03.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let loginScreenToAppSegue = "loginScreenToApp"
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    
    @IBOutlet weak var appAvatar: UIImageView!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var loginInputField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var passwordInputField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var activityIndicator: ActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        appAvatarStartedAnimation()
        labelsStartedAnimation()
        textFieldsStartedAnimation()
        signInButtonStartedAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        loginScrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        activityIndicator.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func appAvatarStartedAnimation() {
        self.appAvatar.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height / 2)
        UIView.animate(withDuration: 1.5,
                       delay: 1,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut,
                       animations: {
                        self.appAvatar.transform = .identity
                       },
                       completion: nil)
        
    }
    
    func labelsStartedAnimation() {
        
        let offcet = abs(self.loginLabel.frame.midY - self.passwordLabel.frame.midY)
        
        loginLabel.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        passwordLabel.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        
        UIView.animateKeyframes(withDuration: 2,
                                delay: 1.5,
                                options: .calculationModeLinear,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                                        
                                        self.loginLabel.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
                                        self.passwordLabel.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
                                        
                                        self.loginLabel.transform = CGAffineTransform(translationX: 0, y: offcet)
                                        self.passwordLabel.transform = CGAffineTransform(translationX: 0, y: -offcet)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                                        self.loginLabel.transform = CGAffineTransform(translationX: 0, y: offcet)
                                        self.passwordLabel.transform = CGAffineTransform(translationX: 0, y: -offcet)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.loginLabel.transform = CGAffineTransform(translationX: 100, y: offcet / 2)
                                                        self.passwordLabel.transform = CGAffineTransform(translationX: -100, y: -(offcet / 2))
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.75,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.loginLabel.transform = .identity
                                                        self.passwordLabel.transform = .identity
                                                       })
                                },
                                completion: nil)
    }
    
    func textFieldsStartedAnimation() {
        self.loginInputField.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        self.passwordInputField.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        UIView.animate(withDuration: 1, delay: 2.5, options: [], animations: {
            self.loginInputField.transform = .identity
            self.passwordInputField.transform = .identity
        }, completion: nil)
    }
    
    func signInButtonStartedAnimation() {
        self.signInButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 1,
                       delay: 3.5,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                        self.signInButton.transform = .identity
                       },
                       completion: nil)
        
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.loginScrollView?.contentInset = contentInsets
        loginScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        loginScrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.loginScrollView?.endEditing(true)
    }
    
    func alertLogin(alertText: String) {
        let alertMessage = UIAlertController(title: "Ошибка!", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertMessage.addAction(okButton)
        present(alertMessage, animated: true, completion: nil)
    }
    
    func hideElements() {
        appAvatar.isHidden = true
        loginLabel.isHidden = true
        loginInputField.isHidden = true
        passwordLabel.isHidden = true
        passwordInputField.isHidden = true
        signInButton.isHidden = true
        
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        //        guard let login = loginInputField.text, !login.isEmpty,
        //              let password = passwordInputField.text, !password.isEmpty else {
        //            alertLogin(alertText: "Заполните все поля")
        //            return
        //        }
        //
        //        guard login == "admin", password == "admin" else {
        //            alertLogin(alertText: "Неверное имя пользователя или пароль")
        //            return
        //        }
        
        hideElements()
        activityIndicator.isHidden = false
        activityIndicator.animation()
        
        let seconds = 1.0 //8.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
            performSegue(withIdentifier: loginScreenToAppSegue, sender: nil)
        }
        
        
    }
    
    
}
