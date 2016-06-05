//
//  LoginViewController.swift
//  Winner's Circle
//
//  Created by Matthew Howes Singleton on 6/1/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var newUserButton: UIButton!
    
    @IBOutlet weak var lostPasswordButton: UIButton!
    
    @IBOutlet weak var onBoardingButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loginButton.loginButtons()
        loginButton.backgroundColor = UIColor(red: 239.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        newUserButton.loginButtons()
        newUserButton.backgroundColor = UIColor(red: 249.0/255.0, green: 214.0/255.0, blue: 0.0/155.0, alpha: 1.0)
        newUserButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
     
        
        lostPasswordButton.loginButtons()
        lostPasswordButton.backgroundColor = UIColor.lightGrayColor()
        lostPasswordButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        
        onBoardingButton.backgroundColor = UIColor.whiteColor()
        onBoardingButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        onBoardingButton.landingPageButtonsRound()
        
        
        
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self
        
        emailAddressTextField.keyboardAppearance = .Dark
        passwordTextField.keyboardAppearance = .Dark
        
        emailAddressTextField.autocorrectionType = .No
        passwordTextField.autocorrectionType = .No
        
        loginAnimation()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil);
        
        
        hideKeyboardWhenTappedAround()
        dismissKeyboard()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func keyboardWillShow(sender: NSNotification) {
        
        view.frame.origin.y = -200
        
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        
        view.frame.origin.y = 0
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func loginInUser(){
        
        if checkFields(){
            
            FIRAuth.auth()?.signInWithEmail(emailAddressTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                
                
                if (error != nil){

                    self.displayMessage(error?.localizedDescription, fromViewController: self)
                    
                } else {
                    
                    
                    
                    self.view.endEditing(true)
                    self.loggedInAnimate1()
                    self.loggedInAnimate2()
                    self.loggedInAnimate3()
                    self.loggedInAnimate4()
                    self.loggedInAnimate5()
                    self.loggedInAnimate6()
                    
                    self.delay(1.4, closure: {
                        self.performSegueWithIdentifier("fromLoginToLanding", sender: self)
                    })
                 
                    uid = user!.uid
                    let ref = firebase.child("users").child(uid).child("name")
                    
                    ref.observeEventType(.Value, withBlock: { snapshot in
                        if let name = snapshot.value as? String{
                            
                            username = name
                            
                        }
                        }
                    )
                    
                }
                
                
            })
            
        }
        
    }
    
    
    func createUser(){
        
        if checkFields(){
            
            FIRAuth.auth()?.createUserWithEmail(emailAddressTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                
                if error == nil && user != nil {
                    
                    self.requestUsername { (username:String) in
                        uid = user!.uid
        
                        firebase.child("users").child(uid).setValue(["isOnline": true, "name": username])
                        self.performSegueWithIdentifier("fromLoginToLanding", sender: self)
                    }
                    
                } else {
                    
                    
                    let controller = UIAlertController(title: "Something went wrong", message: error?.localizedDescription, preferredStyle: .Alert)
                    controller.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) in
                        
                    }))
                    self.presentViewController(controller, animated: true, completion: nil)
                }
                
                
                
            })
            

        }
        
    }
    
    func requestUsername( callback: (username:String) -> Void ) {
        var usernameTextField: UITextField?
        let titleMessage = "Pick a Username"
        let bodyMessage = "Pick a username:"
        let usernameEntry = UIAlertController(title: titleMessage, message: bodyMessage, preferredStyle: .Alert)
        let actionOK = UIAlertAction(title: "Ok", style: .Default) { (UIAlertAction) -> Void in
            
            if let user = usernameTextField?.text{
                print(user)
                username = user
                callback(username: username)
            }
        }
        usernameEntry.addAction(actionOK)
        usernameEntry.addTextFieldWithConfigurationHandler { (username: UITextField) in
            usernameTextField = username
        }
        self.presentViewController(usernameEntry, animated: true, completion: nil)
        
        
    }
    
    func checkFields() -> Bool {
        
        if((!passwordTextField.text!.isEmpty) && (!passwordTextField.text!.isEmpty)){
            return true
        } else {
            print("Empty Field was found")
            self.displayMessage("Empty field was found", fromViewController: self)
            return false
            
        }
        
        
    }
    
    
    
    func loginAnimation(){
        
        view.backgroundColor = UIColor.darkGrayColor()
        
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            
            
            UIView.animateWithDuration(3.0, delay: 0.0, options: .AllowUserInteraction, animations: {
                self.view.layer.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0).CGColor
                }, completion: nil)
            
            
            
            dispatch_async(dispatch_get_main_queue()) {
                self.view.layer.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0).CGColor
            }
        }
        
        
    }
    
    func loggedInAnimate1(){
        
        UIView.animateWithDuration(0.2,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    self.onBoardingButton.center.y += self.view.bounds.width
                                    self.onBoardingButton.alpha = 0.0
                                    
            }, completion: nil)
        
    }
    
    func loggedInAnimate2(){
        
        UIView.animateWithDuration(0.4,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    self.lostPasswordButton.center.y += self.view.bounds.width
                                    self.lostPasswordButton.alpha = 0.0
                                    
            }, completion: nil)
        
    }
    
    func loggedInAnimate3(){
        
        UIView.animateWithDuration(0.6,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    self.newUserButton.center.y += self.view.bounds.width
                                    self.newUserButton.alpha = 0.0
                                    
            }, completion: nil)
        
    }
    
    func loggedInAnimate4(){
        
        UIView.animateWithDuration(0.8,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    self.loginButton.center.y += self.view.bounds.width
                                    self.loginButton.alpha = 0.0
                                    
            }, completion: nil)
        
    }
    
    func loggedInAnimate5(){
        
        UIView.animateWithDuration(1.0,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    self.passwordTextField.center.y += self.view.bounds.width
                                    self.passwordTextField.alpha = 0.0
                                    
            }, completion: nil)
        
    }
    
    func loggedInAnimate6(){
        
        UIView.animateWithDuration(1.2,
                                   delay: 0.0,
                                   options: .CurveLinear,
                                   animations: {
                                    self.emailAddressTextField.center.y += self.view.bounds.width
                                    self.emailAddressTextField.alpha = 0.0
                                    
            }, completion: nil)
        
    }
    
    
    
    
    @IBAction func LoginButtonTapped(sender: UIButton) {
        
        loginInUser()
        
    }
    
    @IBAction func newUserTapped(sender: UIButton) {
        
        createUser()
        
    }
    
    @IBAction func forgotPasswordTapped(sender: UIButton) {
        
        
        
    }
    
    @IBAction func onBoardingTapped(sender: UIButton) {
        
        
        
    }
    
    
}
