//
//  UserLoginHandler.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

protocol UserLoginProtocol {
    
    func userLoginResponseReceived(responseData: ResponseData)
    func userLoginErrorReceived(error: NSError?)
    
}

class UserLoginBridge : ConnectionManagerBridgeProtol {
    
    var delegate: UserLoginProtocol!
    
    init(delegate: UserLoginProtocol) {
        self.delegate = delegate
    }
    
    func responseReceived(responseData: ResponseData) {
        
        delegate.userLoginResponseReceived(responseData)
    }
    
    func errorReceived(error: NSError?) {
        
        delegate.userLoginErrorReceived(error)
    }
}