//
//  ContainerViewController.swift
//  RideShare
//
//  Created by Pushpank Kumar on 28/11/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case collapsed
    case leftPanelExpanded
}

enum ShowWhichVC {
    case homeViewController
}

var showVC: ShowWhichVC = .homeViewController

class ContainerViewController: UIViewController {
    
    var tap: UITapGestureRecognizer!
    
    var homeViewController: HomeViewController!
    var leftViewController: LeftSidePanelViewController!
    var centerController: UIViewController!
    
    var currentState: SlideOutState = .collapsed {
        didSet {
            let shouldShowShadow = (currentState != .collapsed)
            shouldShowShadowForCenterViewController(shouldShowShadow)        }
    }
    
    var isHidden = false
    let centerPanelExpandedOffSet: CGFloat = 160
    
    var delegate: CenterVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCenter(screen: showVC)
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isHidden
    }
}

// MARK: Private Methods
extension ContainerViewController {
    
    private func initCenter(screen: ShowWhichVC) {
        var presentingController: UIViewController
        
        showVC = screen
        
        if homeViewController == nil {
            homeViewController = HomeViewController.instantiate(fromAppStoryboard: .Main)
            homeViewController.delegate = self
        }
        
        presentingController = homeViewController
        
        if let con = centerController {
            con.view.removeFromSuperview()
            con.removeFromParent()
        }
        
        centerController = presentingController
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    private func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.centerController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
    
    private func addChildSidePanelViewController(_ sidePanelController: LeftSidePanelViewController) {
        view.insertSubview(sidePanelController.view, at: 0)
        sidePanelController.didMove(toParent: self)
    }
    
    private func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }
    
    private func setUpWhiteCoverView() {
        let whiteCoverView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        whiteCoverView.alpha = 0.0
        whiteCoverView.backgroundColor = .white
        whiteCoverView.tag = 20
        centerController.view.addSubview(whiteCoverView)
        whiteCoverView.fadeTo(alphaValue: 0.75, withDuration: 0.2)
        
        tap = UITapGestureRecognizer(target: self, action: #selector(animateLeftPanel(shouldExpand:)))
        tap.numberOfTouchesRequired = 1
        centerController.view.addGestureRecognizer(tap)
    }
    
    private func shouldShowShadowForCenterViewController(_ status: Bool) {
        centerController.view.layer.shadowOpacity = status == true ? 0.6 : 0.0
    }
    
    private func hideWhiteCoverView() {
        centerController.view.removeGestureRecognizer(tap)
        for subview in centerController.view.subviews where subview.tag == 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        subview.alpha = 0
                    }) { _ in
                        subview.removeFromSuperview()
                    }
        }
    }
}

// MARK: CenterVCDelegate
extension ContainerViewController: CenterVCDelegate {
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func addLeftPanelViewController() {
        if leftViewController == nil {
            leftViewController = LeftSidePanelViewController.instantiate(fromAppStoryboard: .Main)
            addChildSidePanelViewController(leftViewController)
        }
    }
    
    @objc func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
            isHidden = !isHidden
            animateStatusBar()
            setUpWhiteCoverView()
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(targetPosition: centerController.view.frame.width - centerPanelExpandedOffSet)
        } else {
            isHidden = !isHidden
            animateStatusBar()
            hideWhiteCoverView()
            animateCenterPanelXPosition(targetPosition: 0) { (finished) in
                if finished {
                    self.currentState = .collapsed
                    self.leftViewController = nil
                }
            }
        }
    }
}

