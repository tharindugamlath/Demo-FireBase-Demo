 //
//  DataService.swift
//  Jokes
//
//  Created by Tharindu Gamlath on 5/27/16.
//  Copyright © 2016 Tharindu Gamlath. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let dataService = DataService()
    
    private var BASE_REF = Firebase(url: "\(BASE_URL)")
    private var USER_REF = Firebase(url: "\(BASE_URL)/users")
     private var JOKE_REF = Firebase(url: "\(BASE_URL)/jokes")
    
    var BaseRef : Firebase{
        return BASE_REF
    }
    
    var UserRef :Firebase{
        return USER_REF
    }
    
    var JokeRef : Firebase{
        return JOKE_REF
    }
    
    
    var CurrentUserRef : Firebase {
        let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
        let currentUser = Firebase(url: "\(BASE_URL)").childByAppendingPath("users").childByAppendingPath(userID)
        return currentUser
    }
    
    // Create new user 
    
    func createUserAccount(uid:String,user : Dictionary<String,String>) {
        USER_REF.childByAppendingPath(uid).setValue(user)
    }
    
    func createNewJoke(joke: Dictionary<String, AnyObject>) {
        
        // Save the Joke
        // JOKE_REF is the parent of the new Joke: "jokes".
        // childByAutoId() saves the joke and gives it its own ID.
        
        let firebaseNewJoke = JOKE_REF.childByAutoId()
        firebaseNewJoke.setValue(joke)
    }
    
}

