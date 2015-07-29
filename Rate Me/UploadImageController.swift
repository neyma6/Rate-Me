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

class UploadImageController : DefaultViewController, SubmitProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var cameraUI:UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        cells.append(BlankCell(height: 20, imageNeeds: false))
        cells.append(HeaderCell(title: "Upload Image"))
        cells.append(ImageViewCell())
        cells.append(SubmitCell(delegate: self, submitButtonLabel: "Choose photo", cancelButtonLabel: nil))

        super.viewDidLoad()
    }
    
    func presentCamera() {
        cameraUI = UIImagePickerController()
        cameraUI.delegate = self
        cameraUI.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        cameraUI.mediaTypes = [kUTTypeImage]
        cameraUI.allowsEditing = false
        
        self.presentViewController(cameraUI, animated: true, completion: nil)
    }
    
    //UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        var imageToSave = info[UIImagePickerControllerOriginalImage]as! UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //SubmitProtocol
    func submitButtonPressed(sender: UIButton) {
        presentCamera()
    }
    
    //SubmitProtocol
    func cancelButtonPressed(sender: UIButton) {}
    
    func determineBlankCellSize() ->CGFloat {
        var mainWindowHeight = UIScreen.mainScreen().bounds.height
        var contentHeight = UserLoginCell.CELL_HEIGHT + SubmitCell.CELL_HEIGHT
        var headerHeight = HeaderCell.CELL_HEIGHT
        
        return mainWindowHeight / 2 - contentHeight / 2 - headerHeight;
    }
}