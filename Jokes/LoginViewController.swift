//
//  LoginViewController.swift
//  Jokes
//
//  Created by Tharindu Gamlath on 5/27/16.
//  Copyright © 2016 Tharindu Gamlath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
    
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && DataService.dataService.CurrentUserRef.authData != nil {
                self.performSegueWithIdentifier("CurrentlyLoggedIn", sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(sender: AnyObject) {
        
        let email = txtUsername.text
        let password = txtPassword.text
        
        if email != "" && password != "" {
            
            DataService.dataService.BaseRef.authUser(email, password: password, withCompletionBlock: { (error, authData) in
                
                if error != nil{
                    print(error)
                    self.loginErrorAlert("Oops!", message: "Check your username and password.")
                } else{
                    
                    // storing user id
                    
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    
                    //
                    self.loginErrorAlert("Success!", message: "Login Success!!!!!")

                }
            
            })
            
        }else{
            self.loginErrorAlert("Oops!", message: "Don't forget to enter your email and password.")
        }
        
    }

    func loginErrorAlert(title: String, message: String) {
        
        // Called upon login error to let the user know login didn't work.
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }


}
