//
//  ViewController.swift
//  RideShare
//
//  Created by Pushpank Kumar on 24/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var requestRideButtonOutlet: RoundedShadowButton!
    var delegate: CenterVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

// MARK: IBActions
extension HomeViewController {
    @IBAction func requestRideAction(_ sender: RoundedShadowButton) {
        sender.animateButton(shouldLoad: true, withMessage: nil)
    }
    @IBAction func menuButtonPressed(_ sender: UIButton) {
        delegate?.toggleLeftPanel()
    }
}
