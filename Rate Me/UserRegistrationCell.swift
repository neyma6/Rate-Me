//
//  UserRegistrationCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 26/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class UserRegistrationCell : UITableViewCell, UITextFieldDelegate {

    static let X_START: CGFloat = 20
    static let OFFSET: CGFloat = 40
    static let ELEMENT_HEIGHT: CGFloat = 30
    static let SPACE_BETWEEN_ELEMENTS: CGFloat = 10
    
    var userIdLabel: UILabel!
    var userPasswordLabel: UILabel!
    var userNameLabel: UILabel!
    
    var userIdTextField: CustomTextField!
    var userPasswordTextField: CustomTextField!
    var userNameTextField: CustomTextField!
    
    
    init() {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, 240)
        self.backgroundColor = UIColor.lightGrayColor()
        
        userIdLabel = UIElementCreationUtil.createUILabel(CGRectMake(UserRegistrationCell.X_START, 10, mainWindowBounds.width - UserRegistrationCell.OFFSET, UserRegistrationCell.ELEMENT_HEIGHT), labelText: "Email")
        
        
        userIdTextField = UIElementCreationUtil.createTextField(
            CGRectMake(UserRegistrationCell.X_START, userIdLabel.frame.origin.y + UserRegistrationCell.ELEMENT_HEIGHT, mainWindowBounds.width - UserRegistrationCell.OFFSET, UserRegistrationCell.ELEMENT_HEIGHT),
            placeholder: "Add your email address", delegate: self, isPasswordField: false)
        
        userPasswordLabel = UIElementCreationUtil.createUILabel(
            CGRectMake(UserRegistrationCell.X_START, userIdTextField.frame.origin.y + UserRegistrationCell.ELEMENT_HEIGHT + UserRegistrationCell.SPACE_BETWEEN_ELEMENTS, mainWindowBounds.width - UserRegistrationCell.OFFSET, UserRegistrationCell.ELEMENT_HEIGHT)
            , labelText: "Password")
        
        userPasswordTextField = UIElementCreationUtil.createTextField(
            CGRectMake(UserRegistrationCell.X_START, userPasswordLabel.frame.origin.y + UserRegistrationCell.ELEMENT_HEIGHT , mainWindowBounds.width - UserRegistrationCell.OFFSET, UserRegistrationCell.ELEMENT_HEIGHT),
            placeholder: "Enter a password", delegate: self, isPasswordField: true)
        
        userNameLabel = UIElementCreationUtil.createUILabel(
            CGRectMake(UserRegistrationCell.X_START, userPasswordTextField.frame.origin.y + UserRegistrationCell.ELEMENT_HEIGHT + UserRegistrationCell.SPACE_BETWEEN_ELEMENTS, mainWindowBounds.width - UserRegistrationCell.OFFSET, UserRegistrationCell.ELEMENT_HEIGHT)
            , labelText: "Name")
        
        userNameTextField = UIElementCreationUtil.createTextField(
            CGRectMake(UserRegistrationCell.X_START, userNameLabel.frame.origin.y + UserRegistrationCell.ELEMENT_HEIGHT, mainWindowBounds.width - UserRegistrationCell.OFFSET, UserRegistrationCell.ELEMENT_HEIGHT),
            placeholder: "Enter your name", delegate: self, isPasswordField: false)
        
        self.addSubview(userIdLabel)
        self.addSubview(userIdTextField)
        self.addSubview(userPasswordLabel)
        self.addSubview(userPasswordTextField)
        self.addSubview(userNameLabel)
        self.addSubview(userNameTextField)
    }
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
}