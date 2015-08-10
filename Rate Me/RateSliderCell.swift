//
//  RateSliderCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 09/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import UIKit

class RateSliderCell: UITableViewCell {

    static let CELL_HEIGHT: CGFloat = 150
    static let SIDE_OFFSET: CGFloat = 20
    static let SLIDER_LABEL_HEIGHT: CGFloat = 90
    
    var slider: UISlider!
    var sliderLabel: UILabel!
    
    init() {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, RateSliderCell.CELL_HEIGHT)
        self.backgroundColor = UIColor.clearColor()
        
        sliderLabel = UIElementCreationUtil.createUILabel(CGRectMake(0, 0, mainWindowBounds.width, RateSliderCell.SLIDER_LABEL_HEIGHT), labelText: "5")
        
        
        sliderLabel.textColor = UIColor.whiteColor()
        sliderLabel.textAlignment = NSTextAlignment.Center
        sliderLabel.font = UIFont.systemFontOfSize(75)
        
        slider = UISlider(frame: CGRectMake(RateSliderCell.SIDE_OFFSET, RateSliderCell.SLIDER_LABEL_HEIGHT, mainWindowBounds.width - RateSliderCell.SIDE_OFFSET * 2, 60))
        
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.value = 5.5
        slider.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        slider.backgroundColor = UIColor.clearColor()
        
        self.addSubview(sliderLabel)
        self.addSubview(slider)
        
        removeGestureRecognizerFromSlider()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func sliderValueDidChange(slider: UISlider) {
        var value = Int(slider.value)
        sliderLabel.text = "\(value)"
    }
    
    func removeGestureRecognizerFromSlider() {
        for subview in self.subviews as! [UIView] {
            subview.gestureRecognizers?.removeAll(keepCapacity: false)
        }
    }

}
