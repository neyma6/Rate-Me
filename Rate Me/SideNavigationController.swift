//
//  SideNavigationController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 05/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class SideNavigationController : DefaultViewController {

    override func viewDidLoad() {
        var mainBounds = UIScreen.mainScreen().bounds
        upperGradient = "#FF9500"
        lowerGradient = "#FF9500"
        
        cells.append(SideNavigationCell(width: mainBounds.width * SlideOutController.THRESHOLD, imageName: "name_logo_red.png", text: "Profile"))
        cells.append(SideNavigationCell(width: mainBounds.width * SlideOutController.THRESHOLD, imageName: "others_logo_red.png", text: "Rate others"))
        cells.append(SideNavigationCell(width: mainBounds.width * SlideOutController.THRESHOLD, imageName: "settings_logo_red.png", text: "Edit Profile"))
        cells.append(SideNavigationCell(width: mainBounds.width * SlideOutController.THRESHOLD, imageName: "camera_logo_red.png", text: "Change photo"))
        cells.append(SideNavigationCell(width: mainBounds.width * SlideOutController.THRESHOLD, imageName: "logout_logo_red.png", text: "Sign out"))
        
        super.viewDidLoad()
        
        
        self.view.frame = CGRectMake(0, 0, mainBounds.width * SlideOutController.THRESHOLD, mainBounds.height)
        self.tableView.frame = CGRectMake(0, 0, mainBounds.width * SlideOutController.THRESHOLD, mainBounds.height)
        self.tableView.layer.frame = CGRectMake(0, 0, mainBounds.width * SlideOutController.THRESHOLD, mainBounds.height)
        self.tableView.allowsSelection = true
        var indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: UITableViewScrollPosition.None)
        self.tableView(self.tableView, didSelectRowAtIndexPath: indexPath)

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.redColor()
    }
    
}