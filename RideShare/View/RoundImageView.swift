//
//  RoundImageView.swift
//  RideShare
//
//  Created by Pushpank Kumar on 25/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    
    override func awakeFromNib() {
        setUpView()
    }

    func setUpView() {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }

}
