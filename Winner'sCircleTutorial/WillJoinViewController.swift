//
//  WillJoinViewController.swift
//  Winner's Circle
//
//  Created by Matthew Howes Singleton on 6/3/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class WillJoinViewController: UIViewController {

    @IBOutlet weak var joinLabel: UILabel!
    @IBOutlet weak var joinedImage: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var buttonOutlet: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func joinedTapped(sender: UIButton) {
    }

    @IBAction func backTapped(sender: UIButton) {
    }
   
    @IBAction func nextTapped(sender: UIButton) {
    }


}
