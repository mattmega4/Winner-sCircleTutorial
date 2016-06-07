//
//  LandingPageViewController.swift
//  Winner'sCircleTutorial
//
//  Created by Matthew Howes Singleton on 5/27/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
    


    @IBOutlet weak var startCompButton: UIButton!
    @IBOutlet weak var joinCompButton: UIButton!
    @IBOutlet weak var logoStackView: UIStackView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        
        startCompButton.landingPageButtonsRound()
        startCompButton.setTitle("Start a Competition", forState: .Normal)
        startCompButton.backgroundColor = UIColor(red: 239.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
        
        joinCompButton.landingPageButtonsRound()
        joinCompButton.setTitle("Join a Competition", forState: .Normal)
        joinCompButton.backgroundColor = UIColor(red: 249.0/255.0, green: 214.0/255.0, blue: 0.0/155.0, alpha: 1.0)
        


    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        loggedInAnimate1()
        loggedInAnimate2()
        
    }
    
    
    func animateLogoUpAndButtonsHorizontalAndDownAndSpaced(){
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    self.logoStackView.transform = CGAffineTransformMakeTranslation( 0.0, 17.5 )
                                    
                                    self.buttonsStackView.axis = .Horizontal
                                    self.buttonsStackView.transform = CGAffineTransformMakeTranslation( 0.0, 215.0 )
                                    self.buttonsStackView.spacing = 40.0
                                    
                                    
                                    
                                    self.startCompButton.setTitle("Back", forState: .Normal)
                                    
                                    self.joinCompButton.setTitle("Next", forState: .Normal)
                   
                                    
            }, completion: nil)
        
    }
    
    
    func loggedInAnimate1(){
        
        startCompButton.center = CGPoint(x: 100.0, y: 700.0)
        
        UIView.animateWithDuration(1,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    self.startCompButton.center.y -= self.view.bounds.width
                                    
                                    
            }, completion: nil)
        
    }
    
    func loggedInAnimate2(){
        
        joinCompButton.center = CGPoint(x: 100.0, y: 700.0)
        
        UIView.animateWithDuration(1,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    self.joinCompButton.center.y -= self.view.bounds.width
                                    
                                    
            }, completion: nil)
        
    }
    
    func createRoom(){
        
        let createdRoomRef = firebase.child("room").childByAutoId()
        
        createdRoomRef.child("createdBy").setValue(username)
        
        createdRoomRef.child("status").setValue("seedling")
 
        createdRoomRefGlobal = createdRoomRef
    }
    
    
    @IBAction func startButtonTapped(sender: UIButton) {
        
        animateLogoUpAndButtonsHorizontalAndDownAndSpaced()
        createRoom()
        
        delay(1.6) {
            self.performSegueWithIdentifier("fromLandingToStart", sender: self)
        }
        
    }
    
    
    @IBAction func joinButtonTapped(sender: UIButton) {
        
        
        
    }
    
}
