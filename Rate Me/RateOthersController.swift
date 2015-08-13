//
//  RateOthersController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 09/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import UIKit

class RateOthersController: DefaultViewController, GetRandomUserProtocol, ImageDownloadProtocol, SubmitProtocol, RateUserProtocol {
 
    var user: User?
    var currentUser: User!
    var delegate: SlideOutControllerProtocol!
    
    init(delegate: SlideOutControllerProtocol, currentUser: User) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
        self.currentUser = currentUser
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        self.cells.append(BlankCell(height: 0, imageNeeds: false))
        self.cells.append(HeaderCell(title: ""))
        self.cells.append(ImageViewCell())
        self.cells.append(RateSliderCell())
        self.cells.append(SubmitCell(delegate: self, submitButtonLabel: "Rate!", cancelButtonLabel: nil))
        super.viewDidLoad()

        requestRandomUser()
    }
    
    func requestRandomUser() {
        delegate.showIndicator()
        var request = RequestData(domain: HttpConfig.ENDPOINT, endpoint: "rate/get", method: "GET", processable: currentUser)
        
        var connectionManager = ConnectionManager(delegate: GetRandomUserBridge(delegate: self), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connectionManager.synchonousRequest(request)
    }

    //GetRandomUserProtocol
    func getRandomUserResponseReceived(response: ResponseData) {
        let status = response.status!
        
        if (status == "success") {
            user = response.processable as? User
            
            var headerCell = self.cells[1] as! HeaderCell
            headerCell.headerTitle.text = "Rate \(user!.name!)"
            
            if (response.url != nil) {
                user!.imageUrl = response.url
                downloadProfilePicture(user!)
            }
        } else {
            delegate.hideIndicator()
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
                
                delegate.hideIndicator()
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
    
    //SubmitProtocol
    func submitButtonPressed(sender: UIButton) {
        if (user != nil) {
            var imageCell = cells[3] as! RateSliderCell
            user!.rateValue = Int(imageCell.slider.value)
            var request = RequestData(domain: HttpConfig.ENDPOINT, endpoint: "/rate/set", method: "GET", processable: user!)
            
            var connectionManager = ConnectionManager(delegate: RateUserBridge(delegate: self), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
            connectionManager.synchonousRequest(request)
        }
    }
    
    //SubmitProtocol
    func cancelButtonPressed(sender: UIButton) {
    
    }
    
    //RateUserProtocol
    func rateUserResponseReceived(responseData: ResponseData) {
        var imageCell = cells[3] as! RateSliderCell
        imageCell.slider.value = 5.5
        imageCell.sliderLabel.text = "5"
        requestRandomUser()
    }
    
    //RateUserProtocol
    func rateUserErrorReceived(error: NSError?) {
    
    }

}
