//
//  CircleView.swift
//  RideShare
//
//  Created by Puspank Kumar on 25/11/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

class CircleView: UIView {

    @IBInspectable var borderColor: UIColor? {
        didSet {
            setUpView()
        }
    }
    
    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.borderWidth = 1.0
        self.layer.borderColor = borderColor?.cgColor
    }

}
