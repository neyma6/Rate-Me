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
    
    var label: UILabel!
    var slider: UISlider!
    
    init() {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var mainWindowBounds = UIScreen.mainScreen().bounds
        
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, RateSliderCell.CELL_HEIGHT)
        
        slider = UISlider(frame: CGRectMake(RateSliderCell.SIDE_OFFSET, 0, mainWindowBounds.width - RateSliderCell.SIDE_OFFSET * 2, 30))
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.value = 5.5
        slider.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        
        self.addSubview(slider)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func sliderValueDidChange(slider: UISlider) {
        println(slider.value)
    }

}
