//
//  ConnectionManager.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 20/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation


class ConnectionManager : NSObject, NSURLConnectionDataDelegate {
    
    var requestProcessor: IRequestProcessor!
    var responseProcessor: ResponseProcessor!
    var delegate: ConnectionManagerProtol!
    
    var response: NSMutableData?
    
    init(delegate: ConnectionManagerProtol, requestProcessor: IRequestProcessor,responseProcessor: ResponseProcessor) {
        self.delegate = delegate
        self.requestProcessor = requestProcessor
        self.responseProcessor = responseProcessor
    }

    func synchonousRequest(data: RequestData) {
        let request = requestProcessor.createRequest(data)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)!
        connection.start()
    }
    
    func asynchonousRequest(data: RequestData) {
    }
    
    
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        self.response = NSMutableData()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.response?.appendData(data);
    }
    
    func connection(connection: NSURLConnection, willCacheResponse cachedResponse: NSCachedURLResponse) -> NSCachedURLResponse? {
        return nil
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        
        var error: NSErrorPointer=nil
        
        var json: NSDictionary = NSJSONSerialization.JSONObjectWithData(self.response!, options: NSJSONReadingOptions.MutableContainers, error: error) as! NSDictionary
        
        
        println(json)
        
        //var responseData = self.responseProcessor.processResponse(json: NSDictionary())
        //delegate.responseReceived(responseData)
    }
    
}
