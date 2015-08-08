//
//  LoginController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 29/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class LoginController : DefaultViewController, SubmitProtocol, UserLoginProtocol, ForgetPasswordCellProtocol, SignUpHereCellProtocol {

    override func viewDidLoad() {
        cells.append(BlankCell(height: determineBlankCellSize(), imageNeeds: false))
        cells.append(HeaderCell(title: "Login"))
        cells.append(UserLoginCell())
        cells.append(SubmitCell(delegate: self, submitButtonLabel: "Login", cancelButtonLabel: nil))
        cells.append(ForgetPasswordCell(delegate: self))
        cells.append(SignUpHereCell(delegate: self))
        
        self.view.userInteractionEnabled = true
        super.viewDidLoad()
    }
    
    func determineBlankCellSize() ->CGFloat {
        var mainWindowHeight = UIScreen.mainScreen().bounds.height
        var contentHeight = UserLoginCell.CELL_HEIGHT + SubmitCell.CELL_HEIGHT
        var headerHeight = HeaderCell.CELL_HEIGHT
        
        return mainWindowHeight / 2 - contentHeight / 2 - headerHeight;
    }
    
    //SubmitProtocol
    func submitButtonPressed(sender: UIButton) {
        var loginCell = cells[2] as! UserLoginCell
        var id = loginCell.userIdTextField.text
        var password = loginCell.userPasswordTextField.text
        
        if (id.isEmpty || password.isEmpty) {
            showAlertMessage("Please add your email and your password!")
            
        } else if (!isEmailValid(id)) {
            showAlertMessage("The email that you entered is not a valid email address!")
        } else {
            callServer(id, password: password)
        }
    }
    
    //SubmitProtocol
    func cancelButtonPressed(sender: UIButton) {
        
    }
    
    //ForgetPasswordCellProtocol
    func forgetPasswordButtonPressed() {
    
    }
    
    //UserLoginProtocol
    func userLoginResponseReceived(responseData: ResponseData) {
        
        let status = responseData.status
        
        if (status == "success") {
            var user = responseData.processable as! User
            var url: String? = responseData.url
            
            if (url == nil) {
                var imageUploadController = UploadImageController()
                imageUploadController.currentUser = user
                transformViewToOtherView(imageUploadController)
            } else {
                user.imageUrl = url
                var mainController = SlideOutController(currentUser: user, profilePicture: nil)
                transformViewToOtherView(mainController)
            }
      
            
        } else {
            showAlertMessage("Invalid email or password!")
        }
    }
    
    //UserLoginProtocol
    func userLoginErrorReceived(error: NSError?) {
        showAlertMessage("An error occured. Do you have connection to the internet? Please try again later!")
    }
    
    //SignUpHereCellProtocol
    func signUpHerePressed() {
        transformViewToOtherView(RegistrationController())
    }

    func callServer(id: String, password: String) {
        
        var user = User(userId: id)
        user.password = password
        
        var request = RequestData(domain: HttpConfig.ENDPOINT, endpoint: "user/get", method: "GET", processable: user)
        
        var connection = ConnectionManager(delegate: UserLoginBridge(delegate: self), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connection.synchonousRequest(request)
    }
    
}