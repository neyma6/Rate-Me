//
//  ForgetPasswordCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 29/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

protocol ForgetPasswordCellProtocol {
    func forgetPasswordButtonPressed()
}

class ForgetPasswordCell : UITableViewCell {

    static let CELL_HEIGHT: CGFloat = 30
    static let BUTTON_WIDTH: CGFloat = 120
    static let BUTTON_HEIGHT: CGFloat = 20
    
    var delegate: ForgetPasswordCellProtocol!
    
    init(delegate: ForgetPasswordCellProtocol) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        self.delegate = delegate
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, ForgetPasswordCell.CELL_HEIGHT)
        self.backgroundColor = UIColor.clearColor()
        
        var button = UIElementCreationUtil.createSystemUIButton(CGRectMake(frame.width / 2 - ForgetPasswordCell.BUTTON_WIDTH / 2, frame.height / 2 - ForgetPasswordCell.BUTTON_HEIGHT / 2, ForgetPasswordCell.BUTTON_WIDTH, ForgetPasswordCell.BUTTON_HEIGHT), buttonLabel: "Forget Password?", target: self, action: "buttonPressed:")
        
        self.userInteractionEnabled = true
        
        self.addSubview(button)

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func buttonPressed(sender: UIButton!) {

    }
}