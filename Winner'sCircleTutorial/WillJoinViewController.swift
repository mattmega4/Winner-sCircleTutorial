//
//  WillJoinViewController.swift
//  Winner's Circle
//
//  Created by Matthew Howes Singleton on 6/3/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit
import Firebase

class WillJoinViewController: UIViewController {

    @IBOutlet weak var joinLabel: UILabel!
    @IBOutlet weak var joinedImage: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var buttonOutlet: UIStackView!
    
    var numberOfClicks = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        joinButtonSwitch()
        
        view.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)

        joinedImage.setBackgroundImage(UIImage(named: "checkedOff.png"), forState: .Normal)
        joinLabel.text = "Joining the Competition?"
        joinLabel.textColor = UIColor.whiteColor()
        
        
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
    
    
    func addClick(){
        
        numberOfClicks += 1
        
        joinButtonSwitch()
        
    }
    
    func joinButtonSwitch(){
        
        if numberOfClicks % 2 == 0 {
            
            
            joinedImage.setBackgroundImage(UIImage(named: "checkedOff.png"), forState: .Normal)
            
        } else {
            
            joinedImage.setBackgroundImage(UIImage(named: "checkedOn.png"), forState: .Normal)
            
        }
        
    }
    
    
    func nextContinueJoined(){
        
        
        if numberOfClicks % 2 == 0 {
            
            createdRoomRefGlobal.child("participating").setValue(false)
            
        } else {
            
            createdRoomRefGlobal.child("members").setValue(uid)
            createdRoomRefGlobal.child("participating").setValue(true)
            addMemberNumber()
            
            
            
        }
        
    }
    
    func addMemberNumber(){
        
       
        createdRoomRefGlobal.child("totalNumberOfMembers").runTransactionBlock { (currentData: FIRMutableData) -> FIRTransactionResult in
            
            var value = currentData.value as? Int

            if value == nil {
                value = 0
            }
            
            currentData.value = value! + 1
            return FIRTransactionResult.successWithValue(currentData)
           
            
            
            
        }
        
        
        
    }
    
    func animateEverything(){
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    
                                    
                                    self.joinedImage.center.y += self.view.bounds.width
                                    
                                    
                                    self.joinLabel.center.y += self.view.bounds.width
                                    
                                    self.buttonOutlet.center.y += self.view.bounds.width
                                    
                                    
            }, completion: nil)
        
    }
    
    @IBAction func joinedTapped(sender: UIButton) {
        
        addClick()
        
    }

    @IBAction func backTapped(sender: UIButton) {
        
        animateEverything()
        
        delay(1.6) { 
            self.performSegueWithIdentifier("fromWillJointoStart", sender: self)
        }
        
    }
   
    @IBAction func nextTapped(sender: UIButton) {
        
        animateEverything()
        
        nextContinueJoined()
        
        delay(1.6) { 
            self.performSegueWithIdentifier("fromWillJoinToParcipants", sender: self)
        }
        
    }
    
    
    
    
    



}
