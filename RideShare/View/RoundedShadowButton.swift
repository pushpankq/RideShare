//
//  RoundedShadowButton.swift
//  RideShare
//
//  Created by Puspank Kumar on 25/11/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

class RoundedShadowButton: UIButton {

    var originalSize: CGRect?

    override func awakeFromNib() {
        setUpView()
    }

    func setUpView() {
        originalSize = self.frame
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = false

        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = .zero
    }

    func animateButton(shouldLoad: Bool, withMessage message: String?) {

        let spinner = UIActivityIndicatorView()
        spinner.style = .large
        spinner.color = .darkGray
        spinner.alpha = 0
        spinner.hidesWhenStopped = true
        spinner.tag = 21

        if shouldLoad {

            self.addSubview(spinner)
            self.setTitle("", for: .normal)
    
            UIView.animate(withDuration: 0.1, animations: {
                self.layer.cornerRadius = self.frame.height / 2

                self.frame = CGRect(x: self.frame.midX - (self.frame.height / 2), y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)

            }) { (finished) in
                if finished {

                    spinner.startAnimating()

                    spinner.center = CGPoint(x: self.frame.width / 2 + 1, y: self.frame.width / 2 + 1)
                    
                    UIView.animate(withDuration: 0.2) {
                        spinner.alpha = 1.0
                    }

                }
            }

            self.isUserInteractionEnabled = false

        } else {

            self.isUserInteractionEnabled = true

            for subview in subviews where subview.tag == 21 {
                    subview.removeFromSuperview()
            }
            UIView.animate(withDuration: 0.2) {
                self.layer.cornerRadius = 5.0
                self.frame = self.originalSize!
                
                self.setTitle(message, for: .normal)
            }
        }
    }
}
