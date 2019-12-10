//
//  RoundedTextField.swift
//  RideShare
//
//  Created by Puspank Kumar on 30/11/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

class RoundedCornerTextField: UITextField {
    
    var textRectOffset: CGFloat = 20
    
   override func awakeFromNib() {
        setUpView()
    }

    func setUpView() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {

        return bounds.inset(by: UIEdgeInsets(top: 0, left: textRectOffset, bottom: 0, right: textRectOffset))

    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {

        return bounds.inset(by: UIEdgeInsets(top: 0, left: textRectOffset, bottom: 0, right: textRectOffset))

     }

     override func editingRect(forBounds bounds: CGRect) -> CGRect {

        return bounds.inset(by: UIEdgeInsets(top: 0, left: textRectOffset, bottom: 0, right: textRectOffset))

     }

}
