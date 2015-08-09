//
//  SlideOutController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 02/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

protocol CenterControllerCallBackProtocol {
    func centerControllerShouldBeChanged(menuIndex: Int, user: User, profilePicture: UIImage?)
}

class SlideOutController : UIViewController, SlideOutMenuBarProtocol, SideNavigationControllerProtocol, ImageDownloadedProtocol, CenterControllerCallBackProtocol {

    static let MENU_BAR_HEIGHT: CGFloat = 50
    static let THRESHOLD: CGFloat = 0.4
    
    var centerViewController: UIViewController!
    var leftSlideController: UIViewController!
    var slideOutMenuBar: SlideOutMenuBar!
    var gestureRecognizer: UIPanGestureRecognizer!
    var chosenMenuIndex = 0
    var currentUser: User!
    var profilePicture: UIImage?
    var startTouchPoint: CGPoint?
    var diff: CGFloat?
    var threshold: CGFloat!
    
    init(currentUser: User, profilePicture: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        self.centerViewController = ProfileController(delegate: self, currentUser: currentUser, profilePicture: profilePicture)
        var sideNav = SideNavigationController()
        sideNav.delegate = self
        self.leftSlideController = sideNav
        self.threshold = self.view.frame.width * SlideOutController.THRESHOLD
        self.currentUser = currentUser
        self.profilePicture = profilePicture
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
        
        gestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
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
    
    //SideNavigationControllerProtocol
    func menuSelected(index: Int) {
        if (index == chosenMenuIndex) {
            return
        } else {
            chosenMenuIndex = index
            animateMovement(0)
            
            var controller = selectControllerTypeFromMenuIndex(chosenMenuIndex)
            
            if (controller.isKindOfClass(LoginController)) {
                transformViewToOtherView(controller)
                return
            }
            
            var mainBounds = UIScreen.mainScreen().bounds

            controller.view.frame = CGRectMake(0, SlideOutController.MENU_BAR_HEIGHT, mainBounds.width, mainBounds.height - SlideOutController.MENU_BAR_HEIGHT)
            
            animateMovementWithControllerChange(0, controller: controller)
        }
    }
    
    //ImageDownloadedProtocol
    func imageDownloaded(image: UIImage) {
        self.profilePicture = image
    }
    
    //CenterControllerCallBackProtocol
    func centerControllerShouldBeChanged(menuIndex: Int, user: User, profilePicture: UIImage?) {
        currentUser = user
        if (profilePicture != nil) {
            self.profilePicture = profilePicture
        }
        
        var controller = selectControllerTypeFromMenuIndex(menuIndex)
        changeController(controller)
    }
    
    func animateMovement(endX: CGFloat) {
        UIView.animateWithDuration(0.5, animations: {
            self.centerViewController.view.frame.origin.x = endX
            self.slideOutMenuBar.frame.origin.x = endX
        })
    }
    
    func animateMovementWithControllerChange(endX: CGFloat, controller: UIViewController) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.centerViewController.view.frame.origin.x = endX
            self.slideOutMenuBar.frame.origin.x = endX
            }, completion: {
            finished in
                if (finished) {
                    self.changeController(controller)
                }
        })
        })
    }
    
    func changeController(controller: UIViewController) {
        
        /*controller.view.alpha = 0.0
        self.view.addSubview(controller.view)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                
                self.centerViewController.view.alpha = 0.0
                controller.view.alpha = 1.0
                
                
                }, completion: {
                    finished in
                    if (finished) {
                        self.centerViewController.removeFromParentViewController()
                        self.centerViewController.view.removeFromSuperview()
                        self.centerViewController = controller
                        self.centerViewController.view.addGestureRecognizer(self.gestureRecognizer)
                    }
            })
        })*/
        
        self.centerViewController.removeFromParentViewController()
        self.centerViewController.view.removeFromSuperview()
        self.centerViewController = controller
        self.centerViewController.view.addGestureRecognizer(self.gestureRecognizer)
        self.view.addSubview(self.centerViewController.view)
    }
    
    func selectControllerTypeFromMenuIndex(menuIndex: Int) ->UIViewController {
        var controller: UIViewController?
        switch(menuIndex) {
        case 0:
            controller = ProfileController(delegate: self, currentUser: currentUser, profilePicture: profilePicture)
        case 1:
            controller = RateOthersController()
        case 2:
            controller = EditProfileController()
        case 3:
            var uploadController = UploadImageController()
            uploadController.currentUser = currentUser
            uploadController.delegate = self
            controller = uploadController
        case 4:
            controller = LoginController()
        default: break
        }
        
        return controller!
    }
}