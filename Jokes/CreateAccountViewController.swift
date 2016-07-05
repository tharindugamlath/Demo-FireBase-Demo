//
//  ViewController.swift
//  Jokes
//
//  Created by Tharindu Gamlath on 5/27/16.
//  Copyright © 2016 Tharindu Gamlath. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createAccount(sender: AnyObject) {
        
        let username = txtUsername.text
        let email =  txtEmail.text
        let password = txtPassword.text
        
        if username != "" && email != "" && password != "" {
        
            //set email and password
            DataService.dataService.BaseRef.createUser(email, password: password, withValueCompletionBlock: { error, result in

                if error != nil{
                    
                  self.signUpErrorAlert("Oops!", message: "Having some trouble creating your account. Try again.")
                    
                } else {
                    
                    // Create and Login the New User with authUser
                    DataService.dataService.BaseRef.authUser(email, password: password, withCompletionBlock: {
                        err, authData in
                        
                        let user = ["provider": authData.provider!, "email": email!, "username": username!]

                    
                        // Seal the deal in DataService.swift.
                        DataService.dataService.createUserAccount(authData.uid, user: user)
                    })
                    
                    // Store the uid for future access - handy!
                    NSUserDefaults.standardUserDefaults().setValue(result ["uid"], forKey: "uid")
                    
                    // Enter the app.
                    self.performSegueWithIdentifier("NewUserLoggedIn", sender: nil)
//                    self.signUpErrorAlert("Success", message: "Your account created Successfully !!!!")
                }
            })
            
        }else{
            self.signUpErrorAlert("Oops!", message: "Don't forget to enter your email, password, and a username.")
            
        }
        
    }
    
    func signUpErrorAlert(title:String,message:String) {
        
        //notify user the alerts in sign up
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

}

