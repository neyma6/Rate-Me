//
//  GradientColor.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 28/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class GradientColor {
    let colorTop: CGColorRef!
    let colorBottom: CGColorRef!
    
    let gl: CAGradientLayer
    
    init(firstGradient: String, secondGradient: String) {
        colorTop = UIColor(rgba: firstGradient).CGColor
        colorBottom = UIColor(rgba: secondGradient).CGColor
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
    }
}