//
//  IResponseProcessor.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 21/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

protocol IResponseProcessor {

    func processResponse(json jsonResult: NSDictionary) ->ResponseData
    
}