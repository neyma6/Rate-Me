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
        label.backgroundColor = UIColor.yellowColor()
        
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
}