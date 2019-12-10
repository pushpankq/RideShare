//
//  LeftSidePanelViewController.swift
//  RideShare
//
//  Created by Pushpank Kumar on 28/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit

class LeftSidePanelViewController: UIViewController {
    
    @IBOutlet weak var userImageView: RoundImageView!
    @IBOutlet weak var pickUpModeSwitch: UISwitch!
    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var pickUpModelLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        pickUpModelLabel.isHidden = true
        pickUpModeSwitch.isHidden = false
        pickUpModeSwitch.isOn = false
    }
    
    func observePassengerOrDriver() {
        
    }

    @IBAction func signUpLoginButtonPressed(_ sender: UIButton) {
        
        let loginVC = LoginViewController.instantiate(fromAppStoryboard: .Authentication)
        present(loginVC, animated: true, completion: nil)
    }
    
}
