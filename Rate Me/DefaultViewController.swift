//
//  DefaultViewController.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 26/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class DefaultViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var cells = Array<UITableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = UIScreen.mainScreen().bounds
        createTableView()
    }
    
    func createTableView() {
        var windowRect = UIScreen.mainScreen().bounds
        tableView = UITableView(frame: windowRect, style: UITableViewStyle.Plain)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cells[indexPath.row];
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cells[indexPath.row].frame.height;
    }
    
}