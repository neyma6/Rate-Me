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
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.userInteractionEnabled = true
        
        /*let gradientMain = GradientColor(firstGradient: "#DBDDDE", secondGradient: "#898C90")
        var backgroundLayerMain = gradientMain.gl
        backgroundLayerMain.frame = self.view.frame
        self.view.layer.insertSublayer(backgroundLayerMain, atIndex: 0)*/
        
        createTableView()
    }
    
    func createTableView() {
        var windowRect = UIScreen.mainScreen().bounds
        tableView = UITableView(frame: windowRect, style: UITableViewStyle.Plain)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.userInteractionEnabled = true
        tableView.backgroundColor = UIColor.whiteColor()
        
        let gradientTable = GradientColor(firstGradient: "#FF5E3A", secondGradient: "#FFDB4C", alpha: 1)
        var backgroundLayerTable = gradientTable.gl
        backgroundLayerTable.frame = tableView.frame
        tableView.layer.insertSublayer(backgroundLayerTable, atIndex: 0)
        
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