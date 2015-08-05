//
//  SignUpHereCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 02/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

protocol SignUpHereCellProtocol {
    func signUpHerePressed()
}

class SignUpHereCell : UITableViewCell {

    static let CELL_HEIGHT: CGFloat = 50
    static let BUTTON_WIDTH: CGFloat = 120
    static let BUTTON_HEIGHT: CGFloat = 20
    static let LABEL_HEIGHT: CGFloat = 20
    static let LABEL_WIDTH: CGFloat = 250
    
    var delegate: SignUpHereCellProtocol!
    
    init(delegate: SignUpHereCellProtocol) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        self.delegate = delegate
        
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, SignUpHereCell.CELL_HEIGHT)
        self.backgroundColor = UIColor.clearColor()
        
        var label = UIElementCreationUtil.createUILabel(CGRectMake(frame.width / 2 - SignUpHereCell.LABEL_WIDTH / 2, SignUpHereCell.CELL_HEIGHT / 2 - SignUpHereCell.LABEL_HEIGHT, SignUpHereCell.LABEL_WIDTH, SignUpHereCell.LABEL_HEIGHT), labelText: "Don't you have an account?")
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(15)
        
        var button = UIElementCreationUtil.createSystemUIButton(CGRectMake(frame.width / 2 - SignUpHereCell.BUTTON_WIDTH / 2, frame.height / 2, SignUpHereCell.BUTTON_WIDTH, SignUpHereCell.BUTTON_HEIGHT), buttonLabel: "Sign up here!", target: self, action: "buttonPressed:")
        
        self.userInteractionEnabled = true
        
        self.addSubview(label)
        self.addSubview(button)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func buttonPressed(sender: UIButton!) {
        delegate.signUpHerePressed()
    }
    
}