//
//  ConnectionManager.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 20/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

protocol ConnectionManagerProtol {
    
    func responseReceived(responseData: ResponseData)
    func errorReceived(error: NSError?)
    
}

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
    
    func asynchonousImageDownloadRequest(data: RequestData) {
        
        if let imageUrl = NSURL(string: data.domain) {
            
            let imageRequest: NSURLRequest = NSURLRequest(URL: imageUrl)
            let queue: NSOperationQueue = NSOperationQueue.mainQueue()
            
            NSURLConnection.sendAsynchronousRequest(imageRequest, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                
                var responseDataDict = Dictionary<String, AnyObject>()
                if data != nil {
                    responseDataDict["status"] = "success"
                    responseDataDict["image"] = UIImage(data: data)
                } else {
                    responseDataDict["status"] = "error"
                    responseDataDict["error"] = "no_image"
                }
                
                var responseData = self.responseProcessor.processResponse(json: responseDataDict)
                self.delegate.responseReceived(responseData)
            })
        }
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
        var error: NSError?
        
        if let dict = NSJSONSerialization.JSONObjectWithData(self.response!, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary {
            
            var responseData = self.responseProcessor.processResponse(json: dict)
            delegate.responseReceived(responseData)
            
        } else {
            let resultString = NSString(data: self.response!, encoding: NSUTF8StringEncoding)
            println("Flawed JSON String: \(resultString)")
        }
    }
    
}
