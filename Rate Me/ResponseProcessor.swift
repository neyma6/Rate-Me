//
//  IResponseProcessor.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 21/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

class ResponseProcessor {

    func processResponse(json jsonResult: NSDictionary) ->ResponseData {
        var response = ResponseData()
        if let status = jsonResult.objectForKey("status") as? String {
            response.status = status
        }
        
        if let error = jsonResult.objectForKey("error") as? String {
            response.error = error
        }
        
        if let url = jsonResult.objectForKey("url") as? String {
            response.url = url
        }
        
        return response
    }
    
}