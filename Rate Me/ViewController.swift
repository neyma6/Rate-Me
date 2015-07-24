//
//  ViewController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 20/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ConnectionManagerProtol {

    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var requestData =  RequestData(domain:"http://rate-server.appspot.com", endpoint: "/blob/uploadUrl", method: "GET")

        var connection = ConnectionManager(delegate: self, requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connection.synchonousRequest(requestData)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func responseReceived(responseData: ResponseData) {
        if (counter == 0) {
            counter+=1
            
            var image = Image()
            image.userid = "test_2@test.com"
            image.image = UIImage(named: "test.jpg")!
            
            var requestData =  RequestData(domain:responseData.url!, endpoint: "", method: "POST", processable: image)
            
            var connection = ConnectionManager(delegate: self, requestProcessor: ImageSendRequestProcessor(), responseProcessor: IResponseProcessor())
            
            connection.synchonousRequest(requestData)
        }
        else if (counter == 1) {
            responseData.toString()
        }
    }


}

