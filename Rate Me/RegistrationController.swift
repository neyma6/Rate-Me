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
        cells.append(HeaderCell(title: "Registration"))
        cells.append(UserRegistrationCell())
        cells.append(SubmitCell(delegate: self, submitButtonLabel: "Register", cancelButtonLabel: "Cancel"))
        super.viewDidLoad()
    }
    
    //UserRegistrationProtocol
    func userRegistrationResponseReceived(responseData: ResponseData) {
        responseData.toString()
    }
    
    //UserRegistrationProtocol
    func userRegistrationErrorReceived(error: NSError?) {
        println("error")
    }
    
    //SubmitProtocol
    func submitButtonPressed() {
        callRateServer()
        
    }
    
    //SubmitProtocol
    func cancelButtonPressed() {
    
    }
    
    func callRateServer() {
        var registrationCell = cells[1] as! UserRegistrationCell
        var id = registrationCell.userIdTextField.text
        var password = registrationCell.userPasswordTextField.text
        var name = registrationCell.userNameTextField.text
        
        var user = User(userId: id)
        user.password = password
        user.name = name
        
        var request = RequestData(domain: "http://rate-server.appspot.com/", endpoint: "user/register", method: "GET", processable: user)
        
        var connection = ConnectionManager(delegate: UserRegistrationBridge(delegate: self), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connection.synchonousRequest(request)
    }
}