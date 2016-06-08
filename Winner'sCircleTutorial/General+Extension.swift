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
        
    func loginButtons(){
        
        
        layer.masksToBounds = true
        layer.cornerRadius = 5
        
        
        
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
    
    
    func displayMessage(errorMessage: String?, fromViewController: UIViewController){
        
        let titleMessage = "Error"
        let alert = UIAlertController(title: titleMessage, message: errorMessage, preferredStyle: .Alert)
        let actionOK = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(actionOK)
        fromViewController.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}



extension UILabel{
    
    func categoryLabel(){
        
       font = UIFont(name:"Helvetica-Bold", size: 20)
        textColor = UIColor.whiteColor()
        
    }
    
    func resultsLabel(){
        
        font = UIFont(name: "Helvetica", size: 18)
        textColor = UIColor.whiteColor()
    }
     
}

