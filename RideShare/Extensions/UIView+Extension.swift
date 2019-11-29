//
//  UIView+Extension.swift
//  RideShare
//
//  Created by Puspank Kumar on 29/11/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

extension UIView {
    
    func fadeTo(alphaValue: CGFloat, withDuration duration: TimeInterval) {
        
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
        
    }
}
