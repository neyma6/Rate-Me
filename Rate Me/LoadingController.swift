//
//  LoadingController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 12/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import UIKit

class LoadingController: UIViewController {

    static let INDICATOR_SIZE: CGFloat = 100
    
    var indicator: UIActivityIndicatorView!
    var movingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var mainBounds = UIScreen.mainScreen().bounds
        
        self.view.frame = CGRectMake(0, 0, mainBounds.width, mainBounds.height)
        
        let gradientTable = GradientColor(firstGradient: "#FFCC00", secondGradient: "#FFCC00", alpha: 0.3)
        var backgroundLayerTable = gradientTable.gl
        backgroundLayerTable.frame = self.view.frame
        self.view.layer.insertSublayer(backgroundLayerTable, atIndex: 0)
        
        
        
        /*movingView = UIView(frame: CGRectMake(mainBounds.width / 2 - LoadingController.INDICATOR_SIZE, -LoadingController.INDICATOR_SIZE, LoadingController.INDICATOR_SIZE * 2, LoadingController.INDICATOR_SIZE))
        
        let gradientTable2 = GradientColor(firstGradient: "#FF3B30", secondGradient: "#FF3B30", alpha: 0.7)
        var backgroundLayerTable2 = gradientTable2.gl
        backgroundLayerTable2.frame = CGRectMake(0, 0, movingView.frame.width, movingView.frame.height)
        movingView.layer.insertSublayer(backgroundLayerTable2, atIndex: 0)*/

        
        indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        
        indicator.frame = CGRectMake(self.view.frame.width / 2 - LoadingController.INDICATOR_SIZE / 2,  self.view.frame.height / 2 - LoadingController.INDICATOR_SIZE / 2, LoadingController.INDICATOR_SIZE, LoadingController.INDICATOR_SIZE)
        
        indicator.startAnimating()
        
        self.view.addSubview(indicator)
        
        //self.view.addSubview(movingView)

    }
    
    func animateMovingView(toY: CGFloat) {
        
        UIView.animateWithDuration(0.5, animations: {
            self.movingView.frame = CGRectMake(self.movingView.frame.origin.x, toY, self.movingView.frame.width, self.movingView.frame.height)
        })
        
        print("toY \(toY)")
    }
    
    func showIndicator() {
        movingView.frame.origin.y = 0 - LoadingController.INDICATOR_SIZE
        indicator.startAnimating()
        
        animateMovingView(UIScreen.mainScreen().bounds.height / 2 - LoadingController.INDICATOR_SIZE)
        indicator.frame.origin.y = UIScreen.mainScreen().bounds.height / 2 - LoadingController.INDICATOR_SIZE
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
        
        animateMovingView(UIScreen.mainScreen().bounds.height)
    }

}
