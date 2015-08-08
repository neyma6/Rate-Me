//
//  UploadImageController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 29/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class UploadImageController : DefaultViewController, SubmitProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ImageEndpointProtocol, ImageUploadProtocol {
    
    var currentUser: User!
    var cameraUI:UIImagePickerController = UIImagePickerController()
    var selectedImage: UIImage?
    var delegate: CenterControllerCallBackProtocol?
    
    override func viewDidLoad() {
        cells.append(BlankCell(height: 20, imageNeeds: false))
        cells.append(HeaderCell(title: "Upload photo of you"))
        cells.append(ImageViewCell())
        cells.append(SubmitCell(delegate: self, submitButtonLabel: "Choose photo", cancelButtonLabel: "Upload photo"))
        self.selectedImage = nil
        super.viewDidLoad()
    }
    
    func presentCamera() {
        cameraUI = UIImagePickerController()
        cameraUI.delegate = self
        cameraUI.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        cameraUI.mediaTypes = [kUTTypeImage]
        cameraUI.allowsEditing = true
        
        self.presentViewController(cameraUI, animated: true, completion: nil)
    }
    
    //UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        
        selectedImage = UIImageHelper.resizeImage(selectedImage!, scale: ImageViewCell.IMAGE_SIZE)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        var imageCell = cells[2] as! ImageViewCell
        imageCell.setNewImage(selectedImage!)
        //self.tableView.reloadData()
    }
    
    //UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //SubmitProtocol
    func submitButtonPressed(sender: UIButton) {
        presentCamera()
    }
    
    //SubmitProtocol - upload photo
    func cancelButtonPressed(sender: UIButton) {
        if (selectedImage != nil)
        {
            var request = RequestData(domain: HttpConfig.ENDPOINT, endpoint: "blob/uploadUrl", method: "GET")
            
            var connectionManager = ConnectionManager(delegate: ImageEndpointBridge(delegate: self), requestProcessor: UserRequestProcessor(), responseProcessor: UserResponseProcessor())
            
            connectionManager.synchonousRequest(request)
        } else {
            showAlertMessage("Please select a photo first!")
        }
    }
    
    //ImageEndpointProtocol
    func imageUploadUrlResponseReceived(response: ResponseData) {
        let status = response.status
        
        if (status == "success") {
            
            if let url = response.url {
                
                var imageObj = Image()
                imageObj.userid = currentUser.id
                imageObj.image = selectedImage
                
                var request = RequestData(domain: url, endpoint: "", method: "POST", processable: imageObj)
                
                var connectionManager = ConnectionManager(delegate: ImageUploadBridge(delegate: self), requestProcessor: ImageSendRequestProcessor(), responseProcessor: UserResponseProcessor())
                
                connectionManager.synchonousRequest(request)
                
            } else {
                showAlertMessage("An error occured, please try again later!")
            }
            
        } else {
            showAlertMessage("An error occured, please try again later!")
        }
    }
    
    //ImageEndpointProtocol
    func imageUploadUrlErrorReceived(error: NSError?) {
        showAlertMessage("An error occured, please try again later!")
    }
    
    //ImageUploadProtocol
    func imageUploadResponseReceived(response: ResponseData) {
        let status = response.status
        
        if (status == "success") {
            if let url = response.url {
                currentUser.imageUrl = url
                
                if (delegate == nil) {
                    var mainController = SlideOutController(currentUser: currentUser, profilePicture: selectedImage)
                    transformViewToOtherView(mainController)
                } else {
                    delegate!.centerControllerShouldBeChanged(0, user: currentUser, profilePicture: selectedImage)
                }
            } else {
                showAlertMessage("An error occured, please try again later!")
            }
        } else {
            showAlertMessage("An error occured, please try again later!")
        }
    }
    
    //ImageUploadProtocol
    func imageUploadErrorReceived(error: NSError?) {
        println("error")
    }

    
    
    func determineBlankCellSize() ->CGFloat {
        var mainWindowHeight = UIScreen.mainScreen().bounds.height
        var contentHeight = UserLoginCell.CELL_HEIGHT + SubmitCell.CELL_HEIGHT
        var headerHeight = HeaderCell.CELL_HEIGHT
        
        return mainWindowHeight / 2 - contentHeight / 2 - headerHeight;
    }
}