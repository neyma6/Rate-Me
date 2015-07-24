//
//  ImageRequestProcessor.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 24/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class ImageSendRequestProcessor : IRequestProcessor {

    func createRequest(requestData: RequestData) ->NSMutableURLRequest {
        var imageObj = requestData.processable as! Image
        
        var boundery = "------------------------------------Image_Request"
        var contentType = "multipart/form-data; boundary=\(boundery)"
        var urlObj = NSURL(string: requestData.domain + requestData.endpoint)
        var request = NSMutableURLRequest(URL: urlObj!)
        
        request.HTTPMethod = requestData.method
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")

        var data = NSMutableData()
        var imageData = UIImageJPEGRepresentation(imageObj.image!, 1)
        
        //image
        data.appendData(("\r\n--\(boundery)\r\n" as NSString).dataUsingEncoding(NSUTF8StringEncoding)!)
        data.appendData(("Content-Disposition: form-data; name=\"defaultImage\"; filename=\"\(imageObj.userid!).png\"\r\n" as NSString).dataUsingEncoding(NSUTF8StringEncoding)!)
        data.appendData(("Content-Type: application/octet-stream\r\n\r\n" as NSString).dataUsingEncoding(NSUTF8StringEncoding)!)
        data.appendData(imageData)
        
        //userid
        data.appendData(("\r\n--\(boundery)\r\n" as NSString).dataUsingEncoding(NSUTF8StringEncoding)!)
        data.appendData(("Content-Disposition: form-data; name=\"userid\"\r\n\r\n\(imageObj.userid!)" as NSString).dataUsingEncoding(NSUTF8StringEncoding)!)
        
        data.appendData(("\r\n--\(boundery)\r\n" as NSString).dataUsingEncoding(NSUTF8StringEncoding)!)
        
        request.HTTPBody = data
        
        println(request)
        println()
        
        return request
    }
}
