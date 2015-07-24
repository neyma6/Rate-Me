//
//  URIBuilder.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 21/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

class URIBuilder {

    static let QUESTION_MARK = "?"
    static let AND = "&"
    static let EQUALS = "="
    
    class func buildURI(domain: String, endpoint: String, dictionary: Dictionary<String, String>) ->String {
        var url = domain + endpoint
        
        if ((url.rangeOfString(QUESTION_MARK)) != nil) {
            url += AND
        } else {
            url += QUESTION_MARK
        }
        
        for (key, value) in dictionary {
            url += key + EQUALS + value + AND
        }
        
        return url
    }
}