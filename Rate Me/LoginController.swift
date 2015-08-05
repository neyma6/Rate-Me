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
        responseData.toString()
    }
    
    //UserLoginProtocol
    func userLoginErrorReceived(error: NSError?) {
        println("error")
    }
    
    //SignUpHereCellProtocol
    func signUpHerePressed() {
        
        var registrationController = RegistrationController()
        
        let window = UIApplication.sharedApplication().windows[0] as! UIWindow
        var animationOptions = UIViewAnimationOptions.TransitionFlipFromRight | UIViewAnimationOptions.AllowAnimatedContent
        
        UIView.transitionFromView(
            self.view,
            toView: registrationController.view,
            duration: 0.65,
            options: animationOptions,
            completion: {
                finished in window.rootViewController = registrationController
        })
    }
    
    
    func callServer(id: String, password: String) {
        
        var user = User(userId: id)
        user.password = password
        
        var request = RequestData(domain: "http://rate-server.appspot.com/", endpoint: "user/get", method: "GET", processable: user)
        
        var connection = ConnectionManager(delegate: UserLoginBridge(delegate: self), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connection.synchonousRequest(request)
    }
    
}