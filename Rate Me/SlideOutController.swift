//
//  SlideOutController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 02/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class SlideOutController : UIViewController {

    var centerViewController: UIViewController!
    var leftSlideController: UIViewController!
    
    var startTouchPoint: CGPoint?
    var diff: CGFloat?
    
    init(centerViewController: UIViewController, leftSlideController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.centerViewController = centerViewController
        self.leftSlideController = leftSlideController
        self.centerViewController.view.userInteractionEnabled = true
        self.view.userInteractionEnabled = true
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.frame = UIScreen.mainScreen().bounds
        centerViewController.view.frame = UIScreen.mainScreen().bounds
        
        self.view.addSubview(leftSlideController.view)
        self.view.addSubview(centerViewController.view)
        
        
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
        self.centerViewController.view.addGestureRecognizer(gestureRecognizer)
    }
    
    func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        switch (gestureRecognizer.state) {
            
        case UIGestureRecognizerState.Began:
            startTouchPoint = gestureRecognizer.locationInView(self.centerViewController.view)
            diff = 0
            
            println("s \(startTouchPoint)")
            
        case UIGestureRecognizerState.Changed:
            var touchLocation = gestureRecognizer.locationInView(self.centerViewController.view)

            diff = (touchLocation.x + diff!) - startTouchPoint!.x
            
            println("c \(touchLocation) \(startTouchPoint) \(diff)")
            
            self.centerViewController.view.frame.origin.x = self.centerViewController.view.frame.origin.x + diff!
            
            if (self.centerViewController.view.frame.origin.x < self.view.frame.origin.x) {
                self.centerViewController.view.frame.origin.x = 0
            }
            
            var threshold = self.view.frame.width * 0.4
            
            if (self.centerViewController.view.frame.origin.x > threshold) {
                self.centerViewController.view.frame.origin.x = threshold
            }
            
            startTouchPoint = touchLocation
            
        case UIGestureRecognizerState.Ended:
            var touchLocation = gestureRecognizer.locationInView(self.centerViewController.view)

            println("ended \(touchLocation)")
        default: break
        }
    }
    
    /*override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touchesBegan")
        let touch = touches.first as! UITouch
        let tapCount = touch.tapCount
        
        let point = touch.locationInView(centerViewController.view)

        println("begin: \(point)")
        
        super.touchesBegan(touches, withEvent: event);
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        let tapCount = touch.tapCount
        
        let point = touch.locationInView(centerViewController.view)
        
        println("move: \(point)")
        
        super.touchesMoved(touches, withEvent: event);
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        let tapCount = touch.tapCount
        
        let point = touch.locationInView(centerViewController.view)
        
        println("end: \(point)")
        
        super.touchesEnded(touches, withEvent: event);
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        println("cancelled")
    }*/
    
}