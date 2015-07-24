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
    let domain: String!
    let endpoint: String!
    let method: String!
    var contentType: String?

    init(domain: String, endpoint: String, method: String) {
        self.domain = domain
        self.endpoint = endpoint
        self.method = method
    }
    
    init(domain: String, endpoint: String, method: String, processable: Processable) {
        self.domain = domain
        self.processable = processable
        self.endpoint = endpoint
        self.method = method
    }
}