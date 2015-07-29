//
//  ForgetPasswordCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 29/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class ForgetPasswordCell : UITableViewCell {

    static let CELL_HEIGHT: CGFloat = 30
    static let BUTTON_WIDTH: CGFloat = 120
    static let BUTTON_HEIGHT: CGFloat = 20
    
    init() {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, ForgetPasswordCell.CELL_HEIGHT)
        self.backgroundColor = UIColor.clearColor()
        
        var button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRectMake(frame.width / 2 - ForgetPasswordCell.BUTTON_WIDTH / 2, frame.height / 2 - ForgetPasswordCell.BUTTON_HEIGHT / 2, ForgetPasswordCell.BUTTON_WIDTH, ForgetPasswordCell.BUTTON_HEIGHT)
        button.backgroundColor = UIColor.clearColor()
        button.setTitle("Forget Password?", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button.titleLabel!.font = UIFont.systemFontOfSize(14)

        
        self.addSubview(button)

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}