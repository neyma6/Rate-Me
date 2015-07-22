//
//  UserResponseProcessor.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 22/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

class UserResponseProcessor : IResponseProcessor {

    func processResponse(json jsonResult: NSDictionary) ->ResponseData {
    
        var response = ResponseData()
        if let status = jsonResult.objectForKey("status") as? String {
            
        }
        
        return response
    }
}