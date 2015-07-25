//
//  ImageDownloadHandler.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloadHandler : ConnectionManagerProtol {

    func responseReceived(responseData: ResponseData) {
    
        if (responseData.status == "success") {
            println("success")
        } else {
            println("unsuccessful")

        }
        
        if let imageObj = responseData.processable as! Image? {
            if (imageObj.image != nil) {
                println("image downloaded")
                
                let documentsPath = "/Users/neyma"
                let destinationPath = documentsPath.stringByAppendingPathComponent("downloaded.jpg")
                UIImageJPEGRepresentation(imageObj.image,1.0).writeToFile(destinationPath, atomically: true)
            } else {
                println("image download failed")
            }
        }
    }
    
    
    func errorReceived(error: NSError?) {
    }
}