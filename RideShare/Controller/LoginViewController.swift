//
//  LoginViewController.swift
//  RideShare
//
//  Created by Pushpank Kumar on 29/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: RoundedCornerTextField!
    @IBOutlet weak var passwordTextField: RoundedCornerTextField!
    @IBOutlet weak var authButton: RoundedShadowButton!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
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
    
    @IBAction func authenticationButtonPressed(_ sender: RoundedShadowButton) {
        
        if emailTextField.text?.count != 0 && passwordTextField.text?.count != 0 {
            
            sender.animateButton(shouldLoad: true, withMessage: nil)
            view.endEditing(true)
            
            if let email = emailTextField.text, let password = passwordTextField.text {
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
                    
                    guard let `self` = self else { return }
                    
                    if error == nil {
                        
                        if let user = user {
                            if self.segmentControl.selectedSegmentIndex == 0 {
                                let userData = ["provider": user.user.providerID] as [String: Any]
                                DataService.shared.createFirebaseDBUsers(uid: user.user.uid, userData: userData, isDriver: false)
                            } else {
                                let userData = ["provider": user.user.providerID, "userIsDriver": true, "isPickupModeEnabled": false, "driverIsOnTrip": false] as [String: Any]
                                DataService.shared.createFirebaseDBUsers(uid: user.user.uid, userData: userData, isDriver: true)
                            }
                        }
                        
                        self.dismiss(animated: true, completion: nil)

                    } else {
                        if let error = error {
                            let errorCode = AuthErrorCode(rawValue: error._code)
                            
                            switch errorCode {
                            case .invalidEmail:
                                print("invalid email")
                            case .emailAlreadyInUse:
                                print("emailAlreadyInUse")
                            case .weakPassword:
                                print("weak password")
                            case .wrongPassword:
                                print("wrong password")
                            default:
                                print("An unexpected error ")
                            
                            }
                        }
                        
                        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { [weak self] (user, error) in
                            
                            guard let `self` = self else { return }

                            if error != nil {
                                if let error = error {
                                                  let errorCode = AuthErrorCode(rawValue: error._code)
                                                  
                                                  switch errorCode {
                                                  case .invalidEmail:
                                                      print("invalid email")
                                                  case .emailAlreadyInUse:
                                                      print("emailAlreadyInUse")
                                                  case .weakPassword:
                                                      print("weak password")
                                                  case .wrongPassword:
                                                      print("wrong password")
                                                  default:
                                                      print("An unexpected error ")
                                                  
                                                  }
                                              }
                            } else {
                                if let user = user {
                                    if self.segmentControl.selectedSegmentIndex == 0 {
                                        let userData = ["provider": user.user.providerID] as [String: Any]
                                        DataService.shared.createFirebaseDBUsers(uid: user.user.uid, userData: userData, isDriver: false)
                                    } else {
                                        let userData = ["provider": user.user.providerID, "userIsDriver": true, "isPickupModeEnabled": false, "driverIsOnTrip": false] as [String: Any]
                                        DataService.shared.createFirebaseDBUsers(uid: user.user.uid, userData: userData, isDriver: true)
                                    }
                                }
                                
                                self.dismiss(animated: true, completion: nil)
                                }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
}
