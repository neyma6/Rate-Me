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
    static let Y_START: CGFloat = 20
    static let OFFSET: CGFloat = 40
    static let ELEMENT_HEIGHT: CGFloat = 50
    static let SPACE_BETWEEN_ELEMENTS: CGFloat = 10
    static let CELL_HEIGHT: CGFloat = 210
    
    var userIdTextField: CustomTextField!
    var userPasswordTextField: CustomTextField!
    var userNameTextField: CustomTextField!
    
    
    init() {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, UserRegistrationCell.CELL_HEIGHT)
        self.backgroundColor = UIColor.clearColor()
        
        var idImage = UIImage(named: "email_logo_red.png")
        var idLogo = UIImageView(image: idImage)
        idLogo.frame = CGRectMake(UserRegistrationCell.X_START, UserRegistrationCell.Y_START, UserRegistrationCell.ELEMENT_HEIGHT, UserRegistrationCell.ELEMENT_HEIGHT)
        
        userIdTextField = UIElementCreationUtil.createTextField(
            CGRectMake(UserRegistrationCell.X_START + UserRegistrationCell.ELEMENT_HEIGHT, UserRegistrationCell.Y_START, mainWindowBounds.width - UserRegistrationCell.OFFSET - UserRegistrationCell.ELEMENT_HEIGHT, UserRegistrationCell.ELEMENT_HEIGHT),
            placeholder: "Add your email address", delegate: self, isPasswordField: false)
        
        var passwordImage = UIImage(named: "password_logo_red.png")
        var passwordLogo = UIImageView(image: passwordImage)
        passwordLogo.frame = CGRectMake(UserRegistrationCell.X_START, userIdTextField.frame.origin.y + UserRegistrationCell.ELEMENT_HEIGHT + UserRegistrationCell.SPACE_BETWEEN_ELEMENTS, UserRegistrationCell.ELEMENT_HEIGHT, UserRegistrationCell.ELEMENT_HEIGHT)
        
        
        userPasswordTextField = UIElementCreationUtil.createTextField(
            CGRectMake(UserRegistrationCell.X_START + UserRegistrationCell.ELEMENT_HEIGHT, userIdTextField.frame.origin.y + UserRegistrationCell.ELEMENT_HEIGHT + UserRegistrationCell.SPACE_BETWEEN_ELEMENTS, mainWindowBounds.width - UserRegistrationCell.OFFSET - UserRegistrationCell.ELEMENT_HEIGHT, UserRegistrationCell.ELEMENT_HEIGHT),
            placeholder: "Enter a password", delegate: self, isPasswordField: true)
        
        
        var nameImage = UIImage(named: "name_logo_red.png")
        var nameLogo = UIImageView(image: nameImage)
        nameLogo.frame = CGRectMake(UserRegistrationCell.X_START, userPasswordTextField.frame.origin.y + UserRegistrationCell.ELEMENT_HEIGHT + UserRegistrationCell.SPACE_BETWEEN_ELEMENTS, UserRegistrationCell.ELEMENT_HEIGHT, UserRegistrationCell.ELEMENT_HEIGHT)
        
        userNameTextField = UIElementCreationUtil.createTextField(
            CGRectMake(UserRegistrationCell.X_START + UserRegistrationCell.ELEMENT_HEIGHT, userPasswordTextField.frame.origin.y + UserRegistrationCell.ELEMENT_HEIGHT + UserRegistrationCell.SPACE_BETWEEN_ELEMENTS, mainWindowBounds.width - UserRegistrationCell.OFFSET - UserRegistrationCell.ELEMENT_HEIGHT, UserRegistrationCell.ELEMENT_HEIGHT),
            placeholder: "Enter your name", delegate: self, isPasswordField: false)
        
        self.addSubview(idLogo)
        self.addSubview(userIdTextField)
        self.addSubview(passwordLogo)
        self.addSubview(userPasswordTextField)
        self.addSubview(nameLogo)
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