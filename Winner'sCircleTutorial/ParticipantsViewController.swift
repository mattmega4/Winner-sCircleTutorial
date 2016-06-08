//
//  ParticipantsViewController.swift
//  Winner's Circle
//
//  Created by Matthew Howes Singleton on 6/7/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class ParticipantsViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segmenControl: UISegmentedControl!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var numberOfParticipants = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        
        backButton.landingPageButtonsRound()
        backButton.backgroundColor = UIColor(red: 239.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
        backButton.setTitle("Back", forState: .Normal)
        backButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        nextButton.landingPageButtonsRound()
        nextButton.backgroundColor = UIColor(red: 249.0/255.0, green: 214.0/255.0, blue: 0.0/155.0, alpha: 1.0)
        nextButton.setTitle("Next", forState: .Normal)
        nextButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func segmentedControl(sender: UISegmentedControl) {
        
        switch segmenControl.selectedSegmentIndex {
        case 0:
            numberOfParticipants = "4"
        case 1:
            numberOfParticipants = "6"
        case 2:
            numberOfParticipants = "8"
        case 3:
            numberOfParticipants = "10"
        case 4:
            numberOfParticipants = "12"
        case 5:
            numberOfParticipants = "14"
        case 6:
            numberOfParticipants = "16"
        default:
            break
        }
        
        
    }
    
    
    func numberOfParticipantzGo(){
        
        if numberOfParticipants == "4" {
            
            createdRoomRefGlobal.child("allowedParticipants").setValue(4)
            
        } else if numberOfParticipants == "6" {
           
            createdRoomRefGlobal.child("allowedParticipants").setValue(6)
            
        } else if numberOfParticipants == "8" {
            
            createdRoomRefGlobal.child("allowedParticipants").setValue(8)
            
        } else if numberOfParticipants == "10" {
            
            createdRoomRefGlobal.child("allowedParticipants").setValue(10)
            
        } else if numberOfParticipants == "12" {
            
            createdRoomRefGlobal.child("allowedParticipants").setValue(12)
            
        } else if numberOfParticipants == "14" {
            
            createdRoomRefGlobal.child("allowedParticipants").setValue(14)
            
        } else if numberOfParticipants == "16" {
            
            createdRoomRefGlobal.child("allowedParticipants").setValue(16)
            
        }
        
    }
    
    func animateEverything(){
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    
                                    
                                    self.label.center.y += self.view.bounds.height
                                    
                                    self.segmenControl.center.y += self.view.bounds.height
                                    
                                    self.backButton.center.y += self.view.bounds.height
                                    
                                    self.nextButton.center.y += self.view.bounds.height
                                    
                                    
            }, completion: nil)
        
    }

    @IBAction func backButtonTapped(sender: UIButton) {
        
        animateEverything()
        
        delay(1.6) { 
            self.performSegueWithIdentifier("fromParticipantsoWillJoin", sender: self)
        }
        
    }
    
    
    @IBAction func nextButtontapped(sender: UIButton) {
        
        numberOfParticipantzGo()
        
        animateEverything()
        
        delay(1.6) {
            self.performSegueWithIdentifier("fromParticipantsToReview", sender: self)
        }
        
    }


}
