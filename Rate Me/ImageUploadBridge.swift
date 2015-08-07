//
//  ImageUploadHandler.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

protocol ImageUploadProtocol {
    func imageUploadResponseReceived(response: ResponseData)
    func imageUploadErrorReceived(error: NSError?)
}

class ImageUploadBridge : ConnectionManagerBridgeProtol {
    
    var delegate: ImageUploadProtocol!
    
    init(delegate: ImageUploadProtocol) {
        self.delegate = delegate
    }
    
    func responseReceived(responseData: ResponseData) {
        delegate.imageUploadResponseReceived(responseData)
    }
    
    func errorReceived(error: NSError?) {
        delegate.imageUploadErrorReceived(error)
    }
}