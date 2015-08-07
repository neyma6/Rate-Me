//
//  ImageDownloadHandler.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

protocol ImageDownloadProtocol {
    func imageDownloadResponseReceived(response: ResponseData)
    func imageDownloadErrorReceived(error: NSError?)
}

class ImageDownloadBridge : ConnectionManagerBridgeProtol {

    var delegate: ImageDownloadProtocol!
    
    init(delegate: ImageDownloadProtocol) {
        self.delegate = delegate
    }
    
    func responseReceived(responseData: ResponseData) {
        delegate.imageDownloadResponseReceived(responseData)
    }
    
    
    func errorReceived(error: NSError?) {
        delegate.imageDownloadErrorReceived(error)
    }
}