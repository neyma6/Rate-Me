//
//  RegistrationController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 26/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class RegistrationController : DefaultViewController, UserRegistrationProtocol {

    override func viewDidLoad() {
        cells.append(UserRegistrationCell())
        super.viewDidLoad()
    }
    
    //UserRegistrationProtocol
    func userRegistrationResponseReceived(responseData: ResponseData) {
        
    }
    
    //UserRegistrationProtocol
    func userRegistrationErrorReceived(error: NSError?) {
        
    }
}