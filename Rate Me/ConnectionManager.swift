//
//  ConnectionManager.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 20/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

protocol ConnectionManagerProtol {
    
    func responseReceived(responseData: ResponseData)
    func errorReceived(error: NSError?)
    
}

class ConnectionManager : NSObject, NSURLConnectionDataDelegate {
    
    var requestProcessor: IRequestProcessor!
    var responseProcessor: IResponseProcessor!
    var delegate: ConnectionManagerProtol!
    
    var response: NSMutableData?
    
    init(delegate: ConnectionManagerProtol, requestProcessor: IRequestProcessor,responseProcessor: IResponseProcessor) {
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
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        delegate.errorReceived(error)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        println("finish")
        var error: NSError?
        
        //var json: NSDictionary = NSJSONSerialization.JSONObjectWithData(self.response!, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
        
        //println(json)
        //var responseData = self.responseProcessor.processResponse(json: json)
        //delegate.responseReceived(responseData)
        
        
        if let dict = NSJSONSerialization.JSONObjectWithData(self.response!, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary {
            var responseData = self.responseProcessor.processResponse(json: dict)
            delegate.responseReceived(responseData)
        } else {
            println("nil")
            let resultString = NSString(data: self.response!, encoding: NSUTF8StringEncoding)
            println("Flawed JSON String: \(resultString)")
        }
    }
    
}