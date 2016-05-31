//
//  Keyboard+Extension.swift
//  Winner'sCircleTutorial
//
//  Created by Matthew Howes Singleton on 5/30/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
}