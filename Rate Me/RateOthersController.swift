//
//  RateOthersController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 09/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import UIKit

class RateOthersController: DefaultViewController, GetRandomUserProtocol, ImageDownloadProtocol {
 
    override func viewDidLoad() {
        self.cells.append(BlankCell(height: 0, imageNeeds: false))
        self.cells.append(HeaderCell(title: ""))
        self.cells.append(ImageViewCell())
        self.cells.append(RateSliderCell())
        super.viewDidLoad()

        requestRandomUser()
    }
    
    func requestRandomUser() {
        var request = RequestData(domain: HttpConfig.ENDPOINT, endpoint: "/rate/get", method: "GET")
        
        var connectionManager = ConnectionManager(delegate: GetRandomUserBridge(delegate: self), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connectionManager.synchonousRequest(request)
    }

    //GetRandomUserProtocol
    func getRandomUserResponseReceived(response: ResponseData) {
        let status = response.status!
        
        if (status == "success") {
            var user = response.processable as! User
            
            var headerCell = self.cells[1] as! HeaderCell
            headerCell.headerTitle.text = "Rate \(user.name!)"
            
            if (response.url != nil) {
                user.imageUrl = response.url
                downloadProfilePicture(user)
            }
        } else {
            showAlertMessage("An error occured, please try again later!")
        }
    }
    
    //GetRandomUserProtocol
    func getRandomUserErrorReceived(error: NSError?) {
        println("error")
    }
    
    //ImageDownloadProtocol
    func imageDownloadResponseReceived(response: ResponseData) {
        let status = response.status
        if (status == "success") {
            if let imageObj = response.processable as? Image {
                var imageCell = cells[2] as! ImageViewCell
                imageCell.setNewImage(imageObj.image!)
                
                
                self.tableView.reloadData()
            }
        }
    }
    
    //ImageDownloadProtocol
    func imageDownloadErrorReceived(error: NSError?) {
    
    }
    
    func downloadProfilePicture(user: User) {
            var request = RequestData(domain: user.imageUrl!, endpoint: "", method: "GET")
            
            var connectionManager = ConnectionManager(delegate: ImageDownloadBridge(delegate: self), requestProcessor: NoRequestProcessor(), responseProcessor: DownloadImageResponseProcessor())
            
            connectionManager.asynchonousImageDownloadRequest(request)
    }

}
