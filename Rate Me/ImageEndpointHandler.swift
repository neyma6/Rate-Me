//
//  ImageEndpointHandler.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

class ImageEndpointHandler : ConnectionManagerProtol {

    func responseReceived(responseData: ResponseData) {
        responseData.toString()
    }
    
    func errorReceived(error: NSError?) {
    
    }
}