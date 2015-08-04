//
//  UserLoginCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 29/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class UserLoginCell : UITableViewCell, UITextFieldDelegate {

    static let X_START: CGFloat = 20
    static let Y_START: CGFloat = 20
    static let OFFSET: CGFloat = 40
    static let ELEMENT_HEIGHT: CGFloat = 50
    static let SPACE_BETWEEN_ELEMENTS: CGFloat = 10
    static let CELL_HEIGHT: CGFloat = 150
    
    var userIdTextField: CustomTextField!
    var userPasswordTextField: CustomTextField!

    
    init() {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, UserLoginCell.CELL_HEIGHT)
        self.backgroundColor = UIColor.clearColor()
        
        var idImage = UIImage(named: "email_logo_red.png")
        var idLogo = UIImageView(image: idImage)
        idLogo.frame = CGRectMake(UserLoginCell.X_START, UserLoginCell.Y_START, UserLoginCell.ELEMENT_HEIGHT, UserLoginCell.ELEMENT_HEIGHT)
        
        userIdTextField = UIElementCreationUtil.createTextField(
            CGRectMake(UserLoginCell.X_START + UserLoginCell.ELEMENT_HEIGHT, UserLoginCell.Y_START, mainWindowBounds.width - UserLoginCell.OFFSET - UserLoginCell.ELEMENT_HEIGHT, UserLoginCell.ELEMENT_HEIGHT),
            placeholder: "Enter your email address", delegate: self, isPasswordField: false)
        
        var passwordImage = UIImage(named: "password_logo_red.png")
        var passwordLogo = UIImageView(image: passwordImage)
        passwordLogo.frame = CGRectMake(UserLoginCell.X_START, userIdTextField.frame.origin.y + UserLoginCell.ELEMENT_HEIGHT + UserLoginCell.SPACE_BETWEEN_ELEMENTS, UserLoginCell.ELEMENT_HEIGHT, UserLoginCell.ELEMENT_HEIGHT)
        
        
        userPasswordTextField = UIElementCreationUtil.createTextField(
            CGRectMake(UserLoginCell.X_START + UserLoginCell.ELEMENT_HEIGHT, userIdTextField.frame.origin.y + UserLoginCell.ELEMENT_HEIGHT + UserLoginCell.SPACE_BETWEEN_ELEMENTS, mainWindowBounds.width - UserLoginCell.OFFSET - UserLoginCell.ELEMENT_HEIGHT, UserLoginCell.ELEMENT_HEIGHT),
            placeholder: "Enter your password", delegate: self, isPasswordField: true)
        
        self.userInteractionEnabled = true
        
        self.addSubview(idLogo)
        self.addSubview(userIdTextField)
        self.addSubview(passwordLogo)
        self.addSubview(userPasswordTextField)
 
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