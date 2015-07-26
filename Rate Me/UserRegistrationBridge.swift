//
//  UserRegistrationHandler.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

protocol UserRegistrationProtocol {

    func userRegistrationResponseReceived(responseData: ResponseData)
    func userRegistrationErrorReceived(error: NSError?)
    
}

class UserRegistrationBridge : ConnectionManagerBridgeProtol {
    
    var delegate: UserRegistrationProtocol!
    
    init(delegate: UserRegistrationProtocol) {
        self.delegate = delegate
    }

    func responseReceived(responseData: ResponseData) {
    
        delegate.userRegistrationResponseReceived(responseData)
    }
    
    func errorReceived(error: NSError?) {
    
        delegate.userRegistrationErrorReceived(error)
    }
}