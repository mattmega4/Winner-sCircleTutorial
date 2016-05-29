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
        startCompButton.backgroundColor = UIColor(red: 206.0/255.0, green: 21.0/255.0, blue: 44.0/255.0, alpha: 1.0)
        
        joinCompButton.landingPageButtonsRound()
        joinCompButton.setTitle("Join a Competition", forState: .Normal)
        joinCompButton.backgroundColor = UIColor(red: 204.0/255.0, green: 186.0/255.0, blue: 23.0/155.0, alpha: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateLogoUpAndButtonsHorizontalAndDownAndSpaced(){
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    self.logoStackView.transform = CGAffineTransformMakeTranslation( 0.0, -90.0 )

                                    self.buttonsStackView.axis = .Horizontal
                                    self.buttonsStackView.transform = CGAffineTransformMakeTranslation( 0.0, 90.0 )
                                    self.buttonsStackView.spacing = 40.0
                                    
                                    self.startCompButton.setTitle("Back", forState: .Normal)
                                    
                                    self.joinCompButton.setTitle("Next", forState: .Normal)
                                    
                                    

                                    
                                    
            }, completion: nil)
        
    }

    
    @IBAction func startButtonTapped(sender: UIButton) {
        
        animateLogoUpAndButtonsHorizontalAndDownAndSpaced()
        
    }


    @IBAction func joinButtonTapped(sender: UIButton) {
        
        
        
    }

}
