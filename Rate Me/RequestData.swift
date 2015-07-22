//
//  RequestData.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 20/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

public class RequestData {
    
    var processable: Processable?
    let endpoint: String!
    let method: String!
    let contentType: String!

    init(endpoint: String, method: String, contentType: String) {
        self.endpoint = endpoint
        self.method = method
        self.contentType = contentType
    }
    
    init(endpoint: String, method: String, contentType: String, processable: Processable) {
        self.processable = processable
        self.endpoint = endpoint
        self.method = method
        self.contentType = contentType
    }
}