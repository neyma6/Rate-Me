//
//  GetRandomUserHandler.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

protocol GetRandomUserProtocol {
    func getRandomUserResponseReceived(response: ResponseData)
    func getRandomUserErrorReceived(error: NSError?)
}

class GetRandomUserBridge : ConnectionManagerBridgeProtol {

    var delegate: GetRandomUserProtocol!
    
    init(delegate: GetRandomUserProtocol) {
        self.delegate = delegate
    }
    
    func responseReceived(responseData: ResponseData) {
        delegate.getRandomUserResponseReceived(responseData)
    }
    
    func errorReceived(error: NSError?) {
        delegate.getRandomUserErrorReceived(error)
    }
}