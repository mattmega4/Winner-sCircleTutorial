//
//  FindCompViewController.swift
//  Winner's Circle
//
//  Created by Matthew Howes Singleton on 6/8/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class FindCompViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var autoComplete = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)

        label.textColor = UIColor.whiteColor()
        label.text = "Pick a Theme"
        
        backButton.landingPageButtonsRound()
        backButton.backgroundColor = UIColor(red: 239.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
        backButton.setTitle("Back", forState: .Normal)
        backButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        nextButton.landingPageButtonsRound()
        nextButton.backgroundColor = UIColor(red: 249.0/255.0, green: 214.0/255.0, blue: 0.0/155.0, alpha: 1.0)
        nextButton.setTitle("Next", forState: .Normal)
        nextButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FindCompViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FindCompViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil);
        
        
        hideKeyboardWhenTappedAround()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        
        view.frame.origin.y = -170
        
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        
        view.frame.origin.y = 0
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        self.textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
        
        
        if textField == textField{
            _ = range.length == 0 ? textField.text! + string : (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
            
            
            
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
        
        textField.text = selectedCell.textLabel!.text!
        
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

    

    @IBAction func backTapped(sender: UIButton) {
        
        
        
    }

    @IBAction func nextTapped(sender: UIButton) {
        
        
        
    }

}
