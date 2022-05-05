//
//  LoginViewController.swift
//  Weather
//
//  Created by user on 18.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet
    weak var scrollView: UIScrollView!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
        view.addGestureRecognizer(tapGR)
    }

    override
    func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    //MARK: ACTION
    
    @objc
    func willShowKeyboard(_ notificaion: Notification) {
        guard let info = notificaion.userInfo as NSDictionary?,
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        let keyboadHight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboadHight, right: 0)
    }
    
    @objc
    func willHideKeyboard(_ notificaion: Notification) {
        scrollView.contentInset = .zero
    }
    
    @objc
    func hideScreen() {
        view.endEditing(true)
    }
}

