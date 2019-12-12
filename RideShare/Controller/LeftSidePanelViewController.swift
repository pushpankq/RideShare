//
//  LeftSidePanelViewController.swift
//  RideShare
//
//  Created by Pushpank Kumar on 28/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit
import Firebase

class LeftSidePanelViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userImageView: RoundImageView!
    @IBOutlet weak var pickUpModeSwitch: UISwitch!
    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var pickUpModelLabel: UILabel!
    
    let currentUserId = Auth.auth().currentUser?.uid

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        pickUpModelLabel.isHidden = true
        pickUpModeSwitch.isHidden = true
        pickUpModeSwitch.isOn = false
        
        
        if Auth.auth().currentUser == nil {
            emaillabel.text = ""
            accountTypeLabel.text = ""
            userImageView.isHidden = true
            loginButton.setTitle("Sign Up / Login", for: .normal)
        } else {
            emaillabel.text = Auth.auth().currentUser?.email
            accountTypeLabel.text = ""
            userImageView.isHidden = false
            loginButton.setTitle("Logout", for: .normal)
        }
        
        observePassengerOrDriver()

    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        
        if sender.isOn {
            pickUpModelLabel.text = "PICKUP MODE ENABLE"
            DataService.shared.REF_DRIVERS.child(currentUserId!).updateChildValues(["isPickUPModeEnable" : true])
        }
    }
    
    
    func observePassengerOrDriver() {
        
        DataService.shared.REF_USERS.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.accountTypeLabel.text = "PASSENGER"
                    }
                }
            }
        }
        
        DataService.shared.REF_DRIVERS.observeSingleEvent(of: .value) { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.accountTypeLabel.text = "DRIVER"
                        self.pickUpModelLabel.isHidden = false
                        
                        let switchStatus = snap.childSnapshot(forPath: "isPickupModeEnabled").value as! Bool
                            self.pickUpModeSwitch.isOn = switchStatus
                            self.pickUpModeSwitch.isHidden = false
                             self.pickUpModelLabel.isHidden = false
                    }
                }
            }
        }
        
    }

    @IBAction func signUpLoginButtonPressed(_ sender: UIButton) {
        
        if Auth.auth().currentUser == nil {
            let loginVC = LoginViewController.instantiate(fromAppStoryboard: .Authentication)
            present(loginVC, animated: true, completion: nil)
        } else {
            do {
                try Auth.auth().signOut()
                emaillabel.text = ""
                 accountTypeLabel.text = ""
                 userImageView.isHidden = true
                 pickUpModelLabel.isHidden = true
                 pickUpModeSwitch.isHidden = true
                 loginButton.setTitle("Sign Up / Login", for: .normal)
                
            } catch (let error) {
                print("error ", error.localizedDescription)
            }
        }

    }
    
}
