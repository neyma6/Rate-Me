//
//  DefaultViewController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 26/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class DefaultViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var cells = Array<UITableViewCell>()
    var upperGradient: String = "#FF5E3A"
    var lowerGradient: String = "#FF9500"
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.userInteractionEnabled = true
        
        createTableView()
    }
    
    func createTableView() {
        var windowRect = UIScreen.mainScreen().bounds
        tableView = UITableView(frame: windowRect, style: UITableViewStyle.Plain)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.userInteractionEnabled = true
        tableView.backgroundColor = UIColor.whiteColor()
        
        let gradientTable = GradientColor(firstGradient: upperGradient, secondGradient: lowerGradient, alpha: 1)
        var backgroundLayerTable = gradientTable.gl
        backgroundLayerTable.frame = tableView.frame
        tableView.layer.insertSublayer(backgroundLayerTable, atIndex: 0)
        
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cells[indexPath.row];
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cells[indexPath.row].frame.height;
    }
    
    
    func showAlertMessage(message: String) {
        var alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func isEmailValid(mail: String) ->Bool {
        return Regex("^[0-9a-z\\.-]+@([0-9a-z-]+\\.)+[a-z]{2,4}$").test(mail)
    }
    
    func transformViewToOtherView(controller: UIViewController) {
        let window = UIApplication.sharedApplication().windows[0] as! UIWindow
        var animationOptions = UIViewAnimationOptions.TransitionFlipFromRight | UIViewAnimationOptions.AllowAnimatedContent
        UIView.transitionFromView(
            self.view,
            toView: controller.view,
            duration: 0.5,
            options: animationOptions,
            completion: {
                finished in window.rootViewController = controller
        })
    }
    
}