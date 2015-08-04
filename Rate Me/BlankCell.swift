//
//  BlankCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 28/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class BlankCell : UITableViewCell {
    
    init(height: CGFloat, imageNeeds: Bool) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, height)
        self.backgroundColor = UIColor.clearColor()
        self.userInteractionEnabled = true
        
        if (imageNeeds) {
            var image = UIImage(named: "logo.png")
            var logoView = UIImageView(image: image)
        
            var ratio = height / image!.size.height * 0.9
        
            var imageWidth = image!.size.width * ratio
            var imageHeight = image!.size.height * ratio
            logoView.frame = CGRectMake(self.frame.width / 2 - imageWidth / 2, self.frame.height / 2 - imageHeight / 2, imageWidth, imageHeight)
        
            self.userInteractionEnabled = true
            
            self.addSubview(logoView)
        }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}