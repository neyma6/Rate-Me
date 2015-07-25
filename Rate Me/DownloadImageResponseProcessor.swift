//
//  DownloadImageResponseProcessor.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class DownloadImageResponseProcessor : ResponseProcessor {

    override func processResponse(json jsonResult: NSDictionary) -> ResponseData {
        var responseData = super.processResponse(json: jsonResult)
        
        if let image = jsonResult["image"] as? UIImage {
            var imageObj = Image()
            imageObj.image = image
            
            responseData.processable = imageObj
        }
        
        return responseData
    }
}