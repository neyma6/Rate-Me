//
//  ViewControllerExtension.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 05/08/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    public func resize(size:CGSize, completionHandler:(resizedImage:UIImage, data:NSData)->()) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), { () -> Void in
            var newSize:CGSize = size
            let rect = CGRectMake(0, 0, newSize.width, newSize.height)
            UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
            self.drawInRect(rect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let imageData = UIImageJPEGRepresentation(newImage, 0.5)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completionHandler(resizedImage: newImage, data:imageData)
            })
        })
    }
    
    public func getScale(sizeToScale: CGFloat) ->CGFloat {
        
        var longerSide = self.size.width
        if (longerSide < self.size.height) {
            longerSide = self.size.height
        }
        
        return sizeToScale / longerSide
        
        //var newSize = CGSize(width: self.size.width * scale, height: self.size.height * scale)
    }
}