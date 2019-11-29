//
//  CenterVCDelegate.swift
//  RideShare
//
//  Created by Pushpank Kumar on 29/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import Foundation

protocol CenterVCDelegate {
    func toggleLeftPanel()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldExpand: Bool)
}
