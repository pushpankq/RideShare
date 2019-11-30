//
//  LoginViewController.swift
//  RideShare
//
//  Created by Puspank Kumar on 29/11/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bindToKeyboard()
        addTapGesture()

    }
}

// MARK: Private Methods
extension LoginViewController {
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func handleScreenTap(sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
        }
}

// MARK: IBAction
extension LoginViewController {
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
