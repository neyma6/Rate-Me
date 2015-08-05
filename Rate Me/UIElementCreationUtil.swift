//
//  UIElementCreationUtil.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 26/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class UIElementCreationUtil {

    class func createUILabel(frame: CGRect, labelText: String) ->UILabel {
        
        var label = UILabel()
        label.frame = frame
        label.text = labelText
        
        return label;
    }
    
    class func createTextField(frame: CGRect, placeholder: String, delegate: UITextFieldDelegate?, isPasswordField: Bool) ->CustomTextField {
    
        var textField = CustomTextField()
        textField.frame = frame
        textField.placeholder = placeholder
        textField.secureTextEntry = isPasswordField
        textField.autocorrectionType = UITextAutocorrectionType.No
        textField.keyboardType = UIKeyboardType.Default
        textField.returnKeyType = UIReturnKeyType.Done
        textField.clearButtonMode = UITextFieldViewMode.WhileEditing
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        textField.backgroundColor = UIColor.lightTextColor()
        textField.delegate = delegate
    
        return textField;
    }
    
    class func createUIButton(frame: CGRect, buttonLabel: String, target: AnyObject, action: Selector, imageName: String) ->UIButton {
    
        var button   = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        button.frame = frame
        button.backgroundColor = UIColor.clearColor()
        button.setTitle(buttonLabel, forState: UIControlState.Normal)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        button.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
        return button
    }
    
    
    
    class func createSystemUIButton(frame: CGRect, buttonLabel: String, target: AnyObject, action: Selector) ->UIButton {
        
        var button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = frame
        button.backgroundColor = UIColor.clearColor()
        button.setTitle(buttonLabel, forState: UIControlState.Normal)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button.titleLabel!.font = UIFont.systemFontOfSize(15)
        
        return button
    }
}