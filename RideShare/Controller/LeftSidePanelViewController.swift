//
//  LeftSidePanelViewController.swift
//  RideShare
//
//  Created by Pushpank Kumar on 28/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit

class LeftSidePanelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signUpLoginButtonPressed(_ sender: UIButton) {
        
        let loginVC = LoginViewController.instantiate(fromAppStoryboard: .Authentication)
        present(loginVC, animated: true, completion: nil)
    }
    
}
