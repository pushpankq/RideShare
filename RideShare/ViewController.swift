//
//  ViewController.swift
//  RideShare
//
//  Created by Puspank Kumar on 24/11/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var requestRideButtonOutlet: RoundedShadowButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func requestRideAction(_ sender: RoundedShadowButton) {
        sender.animateButton(shouldLoad: true, withMessage: nil)
    }
}
