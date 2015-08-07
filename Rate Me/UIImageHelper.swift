//
//  UIImageHelper.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 07/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

class UIImageHelper {

    class func resizeImage(image: UIImage, scale: CGFloat) ->UIImage {
        
        var computedScale = image.getScale(scale)
        
        let size = CGSizeApplyAffineTransform(image.size, CGAffineTransformMakeScale(computedScale, computedScale))
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        var resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
}