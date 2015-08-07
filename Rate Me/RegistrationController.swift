//
//  RegistrationController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 26/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class RegistrationController : DefaultViewController, UserRegistrationProtocol, SubmitProtocol {

    override func viewDidLoad() {
        cells.append(BlankCell(height: determineBlankCellSize(), imageNeeds: false))
        cells.append(HeaderCell(title: "Registration"))
        cells.append(UserRegistrationCell())
        cells.append(SubmitCell(delegate: self, submitButtonLabel: "Register", cancelButtonLabel: nil))
        super.viewDidLoad()
    }
    
    //UserRegistrationProtocol
    func userRegistrationResponseReceived(responseData: ResponseData) {
        let status = responseData.status
        
        if (status == "success") {
            var user = responseData.processable as! User
            
            var imageUploadController = UploadImageController()
            imageUploadController.currentUser = user
            transformViewToOtherView(imageUploadController)
            
            
        } else {
            let error = responseData.error
            
            if (error == "user_exists") {
                showAlertMessage("The user already exists!")
            } else {
                showAlertMessage("An error occured, please try again later!")
            }
        }
    }
    
    //UserRegistrationProtocol
    func userRegistrationErrorReceived(error: NSError?) {
        showAlertMessage("An error occured. Do you have connection to the internet? Please try again later!")
    }
    
    //SubmitProtocol
    func submitButtonPressed(sender: UIButton) {
        var registrationCell = cells[2] as! UserRegistrationCell
        var id = registrationCell.userIdTextField.text
        var password = registrationCell.userPasswordTextField.text
        var name = registrationCell.userNameTextField.text
        
        if (id.isEmpty || password.isEmpty || name.isEmpty) {
            showAlertMessage("Please fill every field before pushing Register button!")
        } else {
            callRateServer(id, password: password, name: name)
        }
    }
    
    //SubmitProtocol
    func cancelButtonPressed(sender: UIButton) {
    
    }
    
    func callRateServer(id: String, password: String, name: String) {
        
        var user = User(userId: id)
        user.password = password
        user.name = name
        
        var request = RequestData(domain: HttpConfig.ENDPOINT, endpoint: "user/register", method: "GET", processable: user)
        
        var connection = ConnectionManager(delegate: UserRegistrationBridge(delegate: self), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connection.synchonousRequest(request)
    }
    
    func determineBlankCellSize() ->CGFloat {
        var mainWindowHeight = UIScreen.mainScreen().bounds.height
        var contentHeight = UserRegistrationCell.CELL_HEIGHT + SubmitCell.CELL_HEIGHT
        var headerHeight = HeaderCell.CELL_HEIGHT
        
        return mainWindowHeight / 2 - contentHeight / 2 - headerHeight;
    }
}