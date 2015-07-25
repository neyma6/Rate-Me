//
//  NoRequestProcessor.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 25/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

class NoRequestProcessor : IRequestProcessor {

    func createRequest(requestData: RequestData) ->NSMutableURLRequest {
        return NSMutableURLRequest()
    }
}