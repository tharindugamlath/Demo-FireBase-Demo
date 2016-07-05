//
//  Joke.swift
//  Jokes
//
//  Created by Tharindu Gamlath on 5/29/16.
//  Copyright © 2016 Tharindu Gamlath. All rights reserved.
//

import Foundation
import Firebase
class Joke {
    private var jokeRef : Firebase!
    
    private var jokeKey: String!
    private var jokeName: String!
    private var jokeAge: String!
    private var jokeCountry : String!
    private var userName: String!
    private var jokeImage: String!
    
    
    var jokesKey: String{
        return jokeKey
    }
    
    var jokesName: String{
        return jokeName
    }
    
    var jokesAge: String{
        return jokeAge
    }
    
    var jokesCountry: String{
        return jokeCountry
    }
    
    
    var userCredentials: String{
        return userName
    }
    
    var jokeImages: String{
        return jokeImage
    }
    
    
    init(key: String,dictionary: Dictionary < String, AnyObject>){
        
        self.jokeKey = key
        
        if let jokeNameAss = dictionary["name"] as? String {
            self.jokeName = jokeNameAss
        }
        
        if let jokeAgeAss = dictionary["age"] as? String {
            self.jokeAge = jokeAgeAss
        }
        
        if let jokeCountryAss = dictionary["country"] as? String {
            self.jokeCountry = jokeCountryAss
        }
        
        if let jokeImageAss = dictionary["image"] as? String {
            self.jokeImage = jokeImageAss
        }
        
        if let user = dictionary["author"] as? String{
            self.userName = user
        }else{
            self.userName = ""

        }
        
        
        self.jokeRef = DataService.dataService.JokeRef.childByAppendingPath(self.jokeKey)
        
    }
    
    
}
