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
    
    @IBAction func startButtonTapped(sender: UIButton) {
    }


    @IBAction func joinButtonTapped(sender: UIButton) {
    }

}
