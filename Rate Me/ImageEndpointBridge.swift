//
//  ImageEndpointHandler.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

protocol ImageEndpointProtocol {
    func imageUploadUrlResponseReceived(response: ResponseData)
    func imageUploadUrlErrorReceived(error: NSError?)
}

class ImageEndpointBridge : ConnectionManagerBridgeProtol {

    var delegate: ImageEndpointProtocol!
    
    init(delegate: ImageEndpointProtocol) {
        self.delegate = delegate
    }
    
    func responseReceived(responseData: ResponseData) {
            delegate.imageUploadUrlResponseReceived(responseData)
    }
    
    func errorReceived(error: NSError?) {
        delegate.imageUploadUrlErrorReceived(error)
    }
}