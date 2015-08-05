//
//  SubmitCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 27/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

protocol SubmitProtocol {

    func submitButtonPressed(sender: UIButton)
    func cancelButtonPressed(sender: UIButton)
}

class SubmitCell : UITableViewCell {

    static let CELL_HEIGHT: CGFloat = 70
    static let BUTTON_WIDTH: CGFloat = 150
    static let BUTTON_HEIGHT: CGFloat = 50
    static let SPACE_BETWEEN_BUTTONS: CGFloat = 5
    
    var delegate: SubmitProtocol!
    var submitButtom: UIButton?
    var cancelButtom: UIButton?
    
    init(delegate: SubmitProtocol, submitButtonLabel: String, cancelButtonLabel: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        self.delegate = delegate
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, SubmitCell.CELL_HEIGHT)
        self.backgroundColor = UIColor.clearColor()
        
        var submitButtonRect: CGRect
        if (cancelButtonLabel == nil) {
            
            submitButtonRect = CGRectMake(self.frame.width / 2 - SubmitCell.BUTTON_WIDTH / 2, SubmitCell.CELL_HEIGHT / 2 - SubmitCell.BUTTON_HEIGHT / 2, SubmitCell.BUTTON_WIDTH, SubmitCell.BUTTON_HEIGHT)
            
        } else {
            
            submitButtonRect = CGRectMake(self.frame.width / 2 - SubmitCell.BUTTON_WIDTH - SubmitCell.SPACE_BETWEEN_BUTTONS, SubmitCell.CELL_HEIGHT / 2 - SubmitCell.BUTTON_HEIGHT / 2, SubmitCell.BUTTON_WIDTH, SubmitCell.BUTTON_HEIGHT)
            
            var cancelButtonRect = CGRectMake(self.frame.width / 2 + SubmitCell.SPACE_BETWEEN_BUTTONS, SubmitCell.CELL_HEIGHT / 2 - SubmitCell.BUTTON_HEIGHT / 2, SubmitCell.BUTTON_WIDTH, SubmitCell.BUTTON_HEIGHT)
            
            cancelButtom = UIElementCreationUtil.createUIButton(cancelButtonRect, buttonLabel: cancelButtonLabel!, target: self, action: "buttonPressed:", imageName: "button_basic.png")
            
            self.addSubview(cancelButtom!)
        }
        
        submitButtom = UIElementCreationUtil.createUIButton(submitButtonRect, buttonLabel: submitButtonLabel, target: self, action: "buttonPressed:", imageName: "button_basic.png")
        
        self.userInteractionEnabled = true
        
        self.addSubview(submitButtom!)

    }
    
    func buttonPressed(sender: UIButton!) {
        if (sender == submitButtom) {
            delegate.submitButtonPressed(sender)
        } else {
            delegate.cancelButtonPressed(sender)
        }
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}