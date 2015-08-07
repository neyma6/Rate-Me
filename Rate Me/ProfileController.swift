//
//  ProfileController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 06/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class ProfileController : DefaultViewController, ImageDownloadProtocol {

    var currentUser: User!
    var profilePicture: UIImage?
    
    init(currentUser: User, profilePicture: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        self.currentUser = currentUser
        self.profilePicture = profilePicture
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        cells.append(BlankCell(height: 20, imageNeeds: false))
        cells.append(HeaderCell(title: "\(currentUser!.name!)"))
        cells.append(ImageViewCell())

        super.viewDidLoad()
        
        downloadProfilePicture()
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
    
    func downloadProfilePicture() {
        if (profilePicture == nil) {
            var request = RequestData(domain: currentUser.imageUrl!, endpoint: "", method: "GET")
            
            var connectionManager = ConnectionManager(delegate: ImageDownloadBridge(delegate: self), requestProcessor: NoRequestProcessor(), responseProcessor: DownloadImageResponseProcessor())
            
            connectionManager.asynchonousImageDownloadRequest(request)
        }
    }
    
}