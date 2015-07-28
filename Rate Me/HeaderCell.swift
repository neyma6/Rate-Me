//
//  HeaderCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 28/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class HeaderCell : UITableViewCell {

    static let HEADER_HEIGHT: CGFloat = 50
    static let OFFSET: CGFloat = 20
    static let HEADER_TITLE_HEIGHT: CGFloat = 30
    var headerTitle: UILabel!
    
    init(title: String) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        
        var mainWindowBounds = UIScreen.mainScreen().bounds
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, HeaderCell.HEADER_HEIGHT)
        self.backgroundColor = UIColor.clearColor()
        
        headerTitle = UIElementCreationUtil.createUILabel(CGRectMake(HeaderCell.OFFSET, self.frame.height / 2 - HeaderCell.HEADER_TITLE_HEIGHT / 2, self.frame.width - 2 * HeaderCell.OFFSET, HeaderCell.HEADER_TITLE_HEIGHT), labelText: "Registration")
        
        headerTitle.textAlignment = NSTextAlignment.Center
        headerTitle.font = UIFont.systemFontOfSize(22)
        
        self.addSubview(headerTitle)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}