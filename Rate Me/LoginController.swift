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
        cells.append(BlankCell(height: determineBlankCellSize(), imageNeeds: true))
        cells.append(HeaderCell(title: "Login"))
        cells.append(UserLoginCell())
        cells.append(SubmitCell(delegate: self, submitButtonLabel: "Login", cancelButtonLabel: nil))
        cells.append(ForgetPasswordCell(delegate: self))
        cells.append(SignUpHereCell(delegate: self))
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
        callServer()
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
        println("push")
        //self.presentViewController(RegistrationController(), animated: true, completion: nil)
        
        var secondViewController = RegistrationController()
        
        secondViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        let window = UIApplication.sharedApplication().windows[0] as! UIWindow
        UIView.transitionFromView(
            window.rootViewController!.view,
            toView: secondViewController.view,
            duration: 0.65,
            options: .TransitionCrossDissolve,
            completion: {
                finished in window.rootViewController = secondViewController
        })
    }
    
    
    func callServer() {
        var loginCell = cells[2] as! UserLoginCell
        var id = loginCell.userIdTextField.text
        var password = loginCell.userPasswordTextField.text
        
        var user = User(userId: id)
        user.password = password
        
        var request = RequestData(domain: "http://rate-server.appspot.com/", endpoint: "user/get", method: "GET", processable: user)
        
        var connection = ConnectionManager(delegate: UserLoginBridge(delegate: self), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
        
        connection.synchonousRequest(request)
    }
}