//
//  JokeCellTableViewCell.swift
//  Jokes
//
//  Created by Tharindu Gamlath on 5/30/16.
//  Copyright © 2016 Tharindu Gamlath. All rights reserved.
//

import UIKit
import Firebase

class JokeCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtCountry: UILabel!
    @IBOutlet weak var txtage: UILabel!
    
    var joke: Joke!
    var voteRef: Firebase!
    
    func configureCell(joke : Joke){
        self.txtName.text = joke.jokesName
        self.txtCountry.text = joke.jokesCountry
//        self.txtage.text = joke.jokesAge 
        
//        voteRef = DataService.dataService.CurrentUserRef.childByAppendingPath("votes")
    }
    
}
