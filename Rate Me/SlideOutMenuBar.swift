//
//  SlideOutMenuBar.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 05/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

protocol SlideOutMenuBarProtocol {
    func homeButtonPressed()
}

class SlideOutMenuBar : UIView {
    
    var delegate: SlideOutMenuBarProtocol!
    
    init(frame: CGRect, delegate: SlideOutMenuBarProtocol) {
        super.init(frame: frame)
        
        self.delegate = delegate
        
        let gradientTable = GradientColor(firstGradient: "#FF5E3A", secondGradient: "#FF5E3A", alpha: 1)
        var backgroundLayerTable = gradientTable.gl
        backgroundLayerTable.frame = self.frame
        self.layer.insertSublayer(backgroundLayerTable, atIndex: 0)
        
        var homeButton = UIElementCreationUtil.createUIButton(CGRectMake(5, 5, 40, 40), buttonLabel: "", target: self, action: "buttonPressed:", imageName: "home_logo_red.png")
        
        self.addSubview(homeButton)
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func buttonPressed(sender: UIButton!) {
        delegate?.homeButtonPressed()
    }
}