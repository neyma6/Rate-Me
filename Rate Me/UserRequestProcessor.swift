//
//  UserRequestProcessor.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 21/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

class UserRequestProcessor : IRequestProcessor {

    func createRequest(requestData: RequestData) -> NSMutableURLRequest {
        var url: String
        if (requestData.processable != nil) {
            var user: User = requestData.processable as! User
            var params = createDictionary(user)
            url = URIBuilder.buildURI(requestData.domain, endpoint: requestData.endpoint, dictionary: params)
        } else {
            url = URIBuilder.buildURI(requestData.domain, endpoint: requestData.endpoint, dictionary: Dictionary<String, String>())
        }
        
        NSLog(url)
        
        var urlObj = NSURL(string: url)
        var request = NSMutableURLRequest(URL: urlObj!)
        request.HTTPMethod = requestData.method
        
        return request
    }
    
    func createDictionary(user: User) ->Dictionary<String, String> {
        
        var dictionary = Dictionary<String, String>()
        dictionary["id"] = user.id
        
        if (user.name != nil) {
            dictionary["name"] = user.name
        }
        
        if (user.password != nil) {
            dictionary["password"] = user.password
        }
        
        if (user.rateValue != nil) {
            dictionary["rateValue"] = "\(user.rateValue!)"
        }
        
        return dictionary
    }
    
}