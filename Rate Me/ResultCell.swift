//
//  ResultCell.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 08/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class ResultCell : UITableViewCell {

    static let OFFSET: CGFloat = 30
    static let CELL_HEIGHT: CGFloat = 210
    static let RESULT_HEIGHT: CGFloat = 150
    static let LABEL_HEIGHT: CGFloat = 30
    
    var user: User!
    
    init(user: User) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        self.user = user
        var mainWindowBounds = UIScreen.mainScreen().bounds
        
        self.frame = CGRectMake(0, 0, mainWindowBounds.width, ResultCell.CELL_HEIGHT)
        
        self.backgroundColor = UIColor.clearColor()
        
        var label = UIElementCreationUtil.createUILabel(CGRectMake(0, ResultCell.OFFSET, mainWindowBounds.width, ResultCell.LABEL_HEIGHT), labelText: "Your rate from \(user.numberOfRates!) users is ")
        
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(25)
        
        var divider = Double(user.numberOfRates!)
        
        if (divider == 0) {
            divider = 1
        }
        
        var resultString = String(format: "%.1f", (Double(user.rateValue!) / divider))
        
        var result = UIElementCreationUtil.createUILabel(CGRectMake(0, ResultCell.OFFSET + ResultCell.LABEL_HEIGHT, mainWindowBounds.width, ResultCell.RESULT_HEIGHT), labelText: "\(resultString)")
        
        result.textColor = UIColor.whiteColor()
        result.textAlignment = NSTextAlignment.Center
        result.font = UIFont.systemFontOfSize(75)
        
        self.addSubview(label)
        self.addSubview(result)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
