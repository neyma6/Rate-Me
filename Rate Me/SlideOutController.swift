//
//  SlideOutController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 02/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class SlideOutController : UIViewController, SlideOutMenuBarProtocol {

    static let MENU_BAR_HEIGHT: CGFloat = 50
    static let THRESHOLD: CGFloat = 0.4
    
    var centerViewController: UIViewController!
    var leftSlideController: UIViewController!
    var slideOutMenuBar: SlideOutMenuBar!
    
    var startTouchPoint: CGPoint?
    var diff: CGFloat?
    var threshold: CGFloat!
    
    init(centerViewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.centerViewController = centerViewController
        self.leftSlideController = SideNavigationController()
        self.threshold = self.view.frame.width * SlideOutController.THRESHOLD
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.frame = UIScreen.mainScreen().bounds
        var mainBounds = UIScreen.mainScreen().bounds
        centerViewController.view.frame = CGRectMake(0, SlideOutController.MENU_BAR_HEIGHT, mainBounds.width, mainBounds.height - SlideOutController.MENU_BAR_HEIGHT)
        
        slideOutMenuBar = SlideOutMenuBar(frame: CGRectMake(0, 0, self.view.frame.width, SlideOutController.MENU_BAR_HEIGHT), delegate: self)
        
        self.view.addSubview(leftSlideController.view)
        self.view.addSubview(slideOutMenuBar)
        self.view.addSubview(centerViewController.view)
        
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
        self.centerViewController.view.addGestureRecognizer(gestureRecognizer)
    }
    
    func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        switch (gestureRecognizer.state) {
            
        case UIGestureRecognizerState.Began:
            startTouchPoint = gestureRecognizer.locationInView(self.centerViewController.view)
            diff = 0
            
        case UIGestureRecognizerState.Changed:
            var touchLocation = gestureRecognizer.locationInView(self.centerViewController.view)

            diff = (touchLocation.x + diff!) - startTouchPoint!.x
            
            self.centerViewController.view.frame.origin.x = self.centerViewController.view.frame.origin.x + diff!
            self.slideOutMenuBar.frame.origin.x = self.slideOutMenuBar.frame.origin.x + diff!
            
            if (self.centerViewController.view.frame.origin.x < self.view.frame.origin.x) {
                self.centerViewController.view.frame.origin.x = 0
                self.slideOutMenuBar.frame.origin.x = 0
            }
            
            
            if (self.centerViewController.view.frame.origin.x > threshold) {
                self.centerViewController.view.frame.origin.x = threshold
                self.slideOutMenuBar.frame.origin.x = threshold
            }
            
            startTouchPoint = touchLocation
            
        case UIGestureRecognizerState.Ended:
            var touchLocation = gestureRecognizer.locationInView(self.centerViewController.view)

            var centerViewX = self.centerViewController.view.frame.origin.x
            
            var endX: CGFloat = 0
            if (centerViewX > threshold / 2) {
                endX = threshold
            }
            
            animateMovement(endX)
            
        default: break
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //SlideOutMenuBarProtocol
    func homeButtonPressed() {
        if (self.centerViewController.view.frame.origin.x == 0) {
            animateMovement(threshold)
        } else {
            animateMovement(0)
        }
    }
    
    
    func animateMovement(endX: CGFloat) {
        UIView.animateWithDuration(0.5, animations: {
            self.centerViewController.view.frame.origin.x = endX
            self.slideOutMenuBar.frame.origin.x = endX
        })
    }
}