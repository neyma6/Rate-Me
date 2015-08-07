//
//  ViewController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 20/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import UIKit

class ViewController_shit: UIViewController {

    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var requestData =  RequestData(domain:"http://lh3.googleusercontent.com/yAimlwZuumge5GEnEzdtKwd4ZjTNwP_QaBPLfxP0pS-aGl37mJ7gVbuIy5xiE5CBSnXZBfvByJX_kUIxunB0yG8", endpoint: "", method: "GET")

        //var connection = ConnectionManager(delegate: ImageDownloadBridge(), requestProcessor: NoRequestProcessor(), responseProcessor: DownloadImageResponseProcessor())
        
        //connection.asynchonousImageDownloadRequest(requestData)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

