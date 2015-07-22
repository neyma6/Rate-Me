//
//  ViewController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 20/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ConnectionManagerProtol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user = User(userId: "test_2@test.com")
        user.password = "123"
        user.name = "Test User12".stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        user.rateValue = 2
        var requestData =  RequestData(endpoint: "http://rate-server.appspot.com/rate/get", method: "GET", contentType: "", processable: user)
        
        
        var connection = ConnectionManager(delegate: self, requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connection.synchonousRequest(requestData)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func responseReceived(responseData: ResponseData) {
    
    }


}

