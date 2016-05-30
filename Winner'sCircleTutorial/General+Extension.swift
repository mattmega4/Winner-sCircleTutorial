//
//  General+Extension.swift
//  Winner'sCircleTutorial
//
//  Created by Matthew Howes Singleton on 5/28/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    func landingPageButtonsRound(){
        
        clipsToBounds = true
        layer.cornerRadius = bounds.size.width / 2.0
        titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        titleLabel?.textAlignment = .Center
        titleLabel?.tintColor = UIColor.whiteColor()
        
    }

}

extension NSObject {
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
}