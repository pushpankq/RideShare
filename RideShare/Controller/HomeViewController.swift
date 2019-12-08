//
//  ViewController.swift
//  RideShare
//
//  Created by Pushpank Kumar on 24/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit
import MapKit
import RevealingSplashView
import Crashlytics

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var requestRideButtonOutlet: RoundedShadowButton!
    var delegate: CenterVCDelegate?
    
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")!, iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(revealingSplashView)
        revealingSplashView.animationType = .twitter
        revealingSplashView.startAnimation()
                
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
