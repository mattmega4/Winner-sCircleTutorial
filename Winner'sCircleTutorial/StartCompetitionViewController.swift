//
//  StartCompetitionViewController.swift
//  Winner'sCircleTutorial
//
//  Created by Matthew Howes Singleton on 5/29/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class StartCompetitionViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var startHeightCon: NSLayoutConstraint!
    
    @IBOutlet weak var startWidthCon: NSLayoutConstraint!
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var pickThemeLabel: UILabel!
    
    @IBOutlet weak var themeTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var middleStackView: UIStackView!
    @IBOutlet weak var logoStackView: UIStackView!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBOutlet weak var leftOrTopButton: UIButton!
    @IBOutlet weak var rightOrBottomButton: UIButton!

    
    var autoComplete = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        middleStackView.transform = CGAffineTransformMakeTranslation( 0.0, 35.0 )
        
        leftOrTopButton.landingPageButtonsRound()
        leftOrTopButton.setTitle("Back", forState: .Normal)
        leftOrTopButton.backgroundColor = UIColor(red: 239.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
        
        rightOrBottomButton.landingPageButtonsRound()
        rightOrBottomButton.setTitle("Next", forState: .Normal)
        rightOrBottomButton.backgroundColor = UIColor(red: 249.0/255.0, green: 214.0/255.0, blue: 0.0/155.0, alpha: 1.0)
        
        pickThemeLabel.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        pickThemeLabel.text = "Pick a Theme"
        pickThemeLabel.textColor = UIColor.whiteColor()
        
        
        view.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        
        logoStackView.transform = CGAffineTransformMakeTranslation( 0.0, -90.0 )
        
        buttonStackView.axis = .Horizontal
        buttonStackView.transform = CGAffineTransformMakeTranslation( 0.0, 110.0 )
        buttonStackView.spacing = 40.0
        
        leftOrTopButton.setTitle("Back", forState: .Normal)
        
        rightOrBottomButton.setTitle("Next", forState: .Normal)
        
        slowFadeInMiddleInformation()
        
        
        themeTextField.delegate = self
        themeTextField.backgroundColor = UIColor.whiteColor()
        
        
        tableView.delegate = self
        
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
 
        startHeightCon.constant = 125
        startWidthCon.constant = 270
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func slowFadeInMiddleInformation(){
        
        self.middleStackView.alpha = 0.0
        
        UIView.animateWithDuration(0.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    
                                    self.middleStackView.alpha = 1.0
                                    
                                    
                                    
                                    
            }, completion: nil)
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let index = indexPath.row as Int
        
        cell.textLabel!.text = autoComplete[index]
        
        
        
        cell.textLabel!.font = UIFont(name:"Helvetica", size: 24)
        cell.textLabel?.textAlignment = .Center
        cell.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        
        return cell
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let substring = (textField.text!.lowercaseString as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        substring.lowercaseString
        
        searchAutocompleteEntriesWithSubstring(substring.lowercaseString)
        
        
        if textField == themeTextField{
            _ = range.length == 0 ? textField.text! + string : (themeTextField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
            
            
            
        }
        
        return true
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return autoComplete.count
        
    }
    
    func searchAutocompleteEntriesWithSubstring(substring: String) {
        
        autoComplete.removeAll(keepCapacity: false)
        
        for key in LocalModal().possibleThemesArray {
            
            let myString: NSString! = key.lowercaseString as NSString
            
            let substringRange :NSRange! = myString.rangeOfString(substring)
            
            if (substringRange.location  == 0) {
                autoComplete.append(key)
            }
            
        }
        
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedCell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        themeTextField.text = selectedCell.textLabel!.text!
        
        
    }
    
    
    
    func animateEverythingBack(){
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    self.logoStackView.transform = CGAffineTransformMakeTranslation( 0.0, 0.0 )
                                    
                                    self.buttonStackView.axis = .Vertical
                                    self.buttonStackView.transform = CGAffineTransformMakeTranslation( 0.0, -0.0 )
                                    self.buttonStackView.spacing = 20.0
                                    
                                    self.leftOrTopButton.setTitle("Start a Competition", forState: .Normal)
                                    self.leftOrTopButton.landingPageButtonsRound()
                                    
                                    self.rightOrBottomButton.setTitle("Join a Competition", forState: .Normal)
                                    self.rightOrBottomButton.landingPageButtonsRound()
                                    

                                    
                                    
                                    
                                    
            }, completion: nil)
        
    }
    
    func fadeOutOfMiddleStackView(){
        
        UIView.animateWithDuration(0.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    

                                    
                                    self.middleStackView.alpha = 0.0
                                    
                                    
                                    
                                    
            }, completion: nil)
        
    }
    
    
    
    @IBAction func leftOrTopButtonTapped(sender: UIButton) {
        
        
        animateEverythingBack()
        fadeOutOfMiddleStackView()
        
        delay(1.6) { 
            self.performSegueWithIdentifier("fromStartToLanding", sender: self)
        }
        
        
        
    }
    
    @IBAction func bottomOrRightButtonTapped(sender: UIButton) {
        
        
        
    }
    
    
}
