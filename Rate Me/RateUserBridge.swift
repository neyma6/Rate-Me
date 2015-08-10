//
//  RateUserHandler.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

protocol RateUserProtocol {
    func rateUserResponseReceived(responseData: ResponseData)
    func rateUserErrorReceived(error: NSError?)
}

class RateUserBridge : ConnectionManagerBridgeProtol {

    var delegate: RateUserProtocol!
    
    init(delegate: RateUserProtocol) {
        self.delegate = delegate
    }
    
    func responseReceived(responseData: ResponseData) {
        delegate.rateUserResponseReceived(responseData)
    }
    
    func errorReceived(error: NSError?) {
        delegate.rateUserErrorReceived(error)
    }
}