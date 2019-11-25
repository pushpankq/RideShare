//
//  GradientView.swift
//  RideShare
//
//  Created by Puspank Kumar on 24/11/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

class GradientView: UIView {

    let gradient = CAGradientLayer()
    
    override func awakeFromNib() {
        setUpGradientview()
    }
    
    func setUpGradientview() {
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor(white: 1.0, alpha: 0.0).cgColor]
        gradient.startPoint = .zero
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.locations = [0.1, 1.0]
        self.layer.addSublayer(gradient)
    }

}
