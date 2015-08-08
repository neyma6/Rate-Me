//
//  ImageViewCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 29/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class ImageViewCell : UITableViewCell {
    
    
    static let CELL_HEIGHT: CGFloat = 250
    static let IMAGE_SIZE: CGFloat = 250
    
    var userImageView: UIImageView!
    
    init() {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, ImageViewCell.CELL_HEIGHT)
        self.backgroundColor = UIColor.clearColor()
        
        var image = UIImage(named: "name_logo_red.png")
        
        userImageView = UIImageView(image: image)
        userImageView.frame = CGRectMake(frame.width / 2 - ImageViewCell.IMAGE_SIZE / 2, frame.height / 2 - ImageViewCell.IMAGE_SIZE / 2, ImageViewCell.IMAGE_SIZE, ImageViewCell.IMAGE_SIZE)
        
        self.userInteractionEnabled = true
        
        self.addSubview(userImageView)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setNewImage(image: UIImage) {
        userImageView.removeFromSuperview()
        
        var scale = image.getScale(ImageViewCell.IMAGE_SIZE)
        
        var width = image.size.width * scale
        var height = image.size.height * scale
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width, height)
        
        userImageView.image = image
        userImageView.frame = CGRectMake(frame.width / 2 - width / 2, frame.height / 2 - height / 2, width, height)
        
        
        self.addSubview(userImageView)
    }
}