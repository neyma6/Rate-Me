//
//  SideNavigationCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 05/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class SideNavigationCell : UITableViewCell {

    static let CELL_HEIGHT: CGFloat = 95
    static let IMAGE_SIZE: CGFloat = 60
    static let IMAGE_OFFSET: CGFloat = 10
    static let LABEL_HEIGHT: CGFloat = 20
    
    init(width: CGFloat, imageName: String, text: String) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        self.frame = CGRectMake(0, 0, width, SideNavigationCell.CELL_HEIGHT)
        
        var image = UIImage(named: imageName)
        var imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(self.frame.width / 2 - SideNavigationCell.IMAGE_SIZE / 2, self.frame.height / 2 - SideNavigationCell.IMAGE_SIZE / 2 - SideNavigationCell.IMAGE_OFFSET, SideNavigationCell.IMAGE_SIZE, SideNavigationCell.IMAGE_SIZE)
        
        self.backgroundColor = UIColor.clearColor()
        self.addSubview(imageView)
        
        
        var label = UIElementCreationUtil.createUILabel(CGRectMake(0, self.frame.height / 2 + SideNavigationCell.IMAGE_OFFSET + SideNavigationCell.IMAGE_OFFSET, width, SideNavigationCell.LABEL_HEIGHT), labelText: text)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(15)

        
        self.addSubview(label)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}