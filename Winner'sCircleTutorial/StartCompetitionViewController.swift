//
//  StartCompetitionViewController.swift
//  Winner'sCircleTutorial
//
//  Created by Matthew Howes Singleton on 5/29/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class StartCompetitionViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var pickThemeLabel: UILabel!
    
    @IBOutlet weak var themeTextField: UITextField!

    
    @IBOutlet weak var middleStackView: UIStackView!
    @IBOutlet weak var logoStackView: UIStackView!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBOutlet weak var leftOrTopButton: UIButton!
    @IBOutlet weak var rightOrBottomButton: UIButton!

    
    var autoComplete = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
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
        
        
        themeTextField.keyboardAppearance = .Dark
        themeTextField.autocorrectionType = .No

        
        
        leftOrTopButton.setTitle("Back", forState: .Normal)
        
        rightOrBottomButton.setTitle("Next", forState: .Normal)
        
//        slowFadeInMiddleInformation()
        
        
        themeTextField.delegate = self
        themeTextField.backgroundColor = UIColor.whiteColor()
        
        
        tableView.delegate = self
        
        
        
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
 
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(StartCompetitionViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(StartCompetitionViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil);
        
        
        hideKeyboardWhenTappedAround()
        
        
    }
    
    
    @objc func keyboardWillShow(sender: NSNotification) {
        
        view.frame.origin.y = -170
        
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        
        view.frame.origin.y = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        self.themeTextField.resignFirstResponder()

        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
        
        autoComplete.removeAll(keepCapacity: false)
        
        tableView.reloadData()
        
        view.endEditing(true)
    }
    
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return !(gestureRecognizer.locationInView(self.tableView).x > 0 &&
                gestureRecognizer.locationInView(self.tableView).x < self.tableView.bounds.size.width && gestureRecognizer.locationInView(self.tableView).y > 0 &&
                    gestureRecognizer.locationInView(self.tableView).y < self.tableView.bounds.size.height)
    }
    
    func animateEverything(){
        
        UIView.animateWithDuration(1.5,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    
                                    
                                    
                                    self.middleStackView.center.y += self.view.bounds.width
                                    
                                    
                                    self.buttonStackView.center.y += self.view.bounds.width
                                    
                                    
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
    
    func nextContinue(){
        
        var textFieldText = String()
        
        var isAMatch = false
        
        if let text = themeTextField.text {
            
            textFieldText = text
            
            for key in LocalModal().possibleThemesArray {
                if key == text {
                    isAMatch = true
                }
            }
        }
        
        if isAMatch {
            
            createdRoomRefGlobal.child("theme").setValue(textFieldText)
            
            self.performSegueWithIdentifier("fromStartToWillJoin", sender: self)
        }
        else {
            displayMessage("Please Choose From the List", fromViewController: self)
        }
        
    
    
    }
    
    @IBAction func leftOrTopButtonTapped(sender: UIButton) {
        
        
        animateEverything()
        fadeOutOfMiddleStackView()
        
        createdRoomRefGlobal.child("status").setValue("killed")
        
        delay(1.6) { 
            self.performSegueWithIdentifier("fromStartToLanding", sender: self)
        }
        
        
        
    }
    
    @IBAction func bottomOrRightButtonTapped(sender: UIButton) {
        
        animateEverything()
        nextContinue()
        
        
        
    }
    
}
