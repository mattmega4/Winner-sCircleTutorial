//
//  JoinOrFindViewController.swift
//  Winner's Circle
//
//  Created by Matthew Howes Singleton on 6/8/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class JoinOrFindViewController: UIViewController {

    
    @IBOutlet weak var topButton: UIButton!
    
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        
        topButton.landingPageButtonsRound()
        topButton.backgroundColor = UIColor(red: 249.0/255.0, green: 214.0/255.0, blue: 0.0/155.0, alpha: 1.0)
        topButton.setTitle("Find", forState: .Normal)
        topButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        
        middleButton.landingPageButtonsRound()
        middleButton.backgroundColor = UIColor(red: 239.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
        middleButton.setTitle("My Competition", forState: .Normal)
        middleButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        
        bottomButton.landingPageButtonsRound()
        bottomButton.backgroundColor = UIColor(red: 79.0/255.0, green: 184.0/255.0, blue: 184.0/255.0, alpha: 1.0)
        bottomButton.setTitle("Back", forState: .Normal)
        bottomButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    
        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        animateEverythingIn()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateEverythingIn(){
        
        self.topButton.center = CGPoint(x: 100.0, y: 700.0)
       self.middleButton.center = CGPoint(x: 100.0, y: 700.0)
        self.bottomButton.center = CGPoint(x: 100.0, y: 700.0)
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    
                                    
                                    self.topButton.center.y -= self.view.bounds.height
                                    
                                    self.middleButton.center.y -= self.view.bounds.height
                                    
                                    self.bottomButton.center.y -= self.view.bounds.height
                                    
                                    
                                    
                                    
                                    
            }, completion: nil)
        
    }
    
    func animateEverything(){
        

        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    
                                    
                                    self.topButton.center.y += self.view.bounds.height
                                    
                                    self.middleButton.center.y += self.view.bounds.height
                                    
                                    self.bottomButton.center.y += self.view.bounds.height
                                    
                                    
                                    
                                    
                                    
            }, completion: nil)
        
    }
    
    @IBAction func topButtonTapped(sender: UIButton) {
        
        animateEverything()
        delay(1.6) { 
            self.performSegueWithIdentifier("fromJoinOrFindToFind", sender: self)
        }
    }

    @IBAction func middleButton(sender: UIButton) {
        
        animateEverything()
        // do stuff
    }
    
    @IBAction func bottomButtonTapped(sender: UIButton) {
        
        animateEverything()
        delay(1.6) { 
            self.performSegueWithIdentifier("fromLandingJoinOrFind", sender: self)
        }
        
    }


}
