//
//  UserResponseProcessor.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 22/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

class UserResponseProcessor : IResponseProcessor {

    override func processResponse(json jsonResult: NSDictionary) ->ResponseData {
    
        var response = super.processResponse(json: jsonResult)
        
        if let user = jsonResult.objectForKey("user") as? NSDictionary {
            if let id = user["id"] as? String {
                var userObj = User(userId: id)
                
                if let password = user["password"] as? String {
                    userObj.password = password
                }
                
                if let name = user["name"] as? String {
                    userObj.name = name
                }
                
                if let imageUrl = user["imageUrl"] as? String {
                    userObj.imageUrl = imageUrl
                }
                
                if let rateValue = user["rateValues"] as? Int {
                    userObj.rateValue = rateValue
                }
                
                if let numberOfRates = user["numberOfRates"] as? Int {
                    userObj.numberOfRates = numberOfRates
                }
                
                response.processable = userObj
            }
            
            
        }
        
        return response
    }
}