//
//  ReviewViewController.swift
//  Winner's Circle
//
//  Created by Matthew Howes Singleton on 6/8/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit
import Firebase

class ReviewViewController: UIViewController {

    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var whatThemeLabel: UILabel!
    @IBOutlet weak var participationLabel: UILabel!
    @IBOutlet weak var areYouParticipatingLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var howManyParticipantsLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        
        reviewLabel.font = UIFont(name:"Helvetica-Bold", size: 30)
        reviewLabel.textColor = UIColor.whiteColor()
        
        themeLabel.categoryLabel()
        whatThemeLabel.resultsLabel()
        
        participationLabel.categoryLabel()
        areYouParticipatingLabel.resultsLabel()
        
        participantsLabel.categoryLabel()
        howManyParticipantsLabel.resultsLabel()
        
        backButton.landingPageButtonsRound()
        backButton.backgroundColor = UIColor(red: 239.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
        backButton.setTitle("Back", forState: .Normal)
        backButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        startButton.landingPageButtonsRound()
        startButton.backgroundColor = UIColor(red: 249.0/255.0, green: 214.0/255.0, blue: 0.0/155.0, alpha: 1.0)
        startButton.setTitle("Start", forState: .Normal)
        startButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pullDownCompetitionInformationForLabels(){
        
        //TO DO
        
        //for each label pull down the information
        
        
    }
    
    func animateEverything(){
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    
                                    
                                    self.reviewLabel.center.y += self.view.bounds.height
                                    
                                    self.themeLabel.center.y += self.view.bounds.height
                                    
                                    self.whatThemeLabel.center.y += self.view.bounds.height
                                    
                                    self.participationLabel.center.y += self.view.bounds.height

                                    self.areYouParticipatingLabel.center.y += self.view.bounds.height

                                    self.participantsLabel.center.y += self.view.bounds.height

                                    self.howManyParticipantsLabel.center.y += self.view.bounds.height

                                    self.backButton.center.y += self.view.bounds.height
                                    
                                    self.startButton.center.y += self.view.bounds.height


                                    
            }, completion: nil)
        
    }
    
    @IBAction func backButtonTapped(sender: UIButton) {
        
        self.animateEverything()
        self.delay(1.6) { 
            self.performSegueWithIdentifier("fromReviewToParticipants", sender: self)
        }
        
        
    }

    @IBAction func nextButtonTapped(sender: UIButton) {
        
        animateEverything()
        createdRoomRefGlobal.child("status").setValue("active")
        // go to next page...
        
    }


}
