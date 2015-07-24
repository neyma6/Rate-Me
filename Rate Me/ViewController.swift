//
//  ViewController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 20/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var requestData =  RequestData(domain:"http://rate-server.appspot.com", endpoint: "/blob/uploadUrl", method: "GET")

        var connection = ConnectionManager(delegate: ImageEndpointHandler(), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connection.synchonousRequest(requestData)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

