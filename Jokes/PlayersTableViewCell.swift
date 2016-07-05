//
//  PlayersTableViewCell.swift
//  Jokes
//
//  Created by Tharindu Gamlath on 5/30/16.
//  Copyright © 2016 Tharindu Gamlath. All rights reserved.
//

import UIKit
import Firebase

class PlayersTableViewCell: UITableViewCell {

   
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var imageViewJoke: UIImageView!
    
    let IMPACT_GRAY = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
    
    //IMPACT_GRAY         [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0]

    
    var joke: Joke!
    var ageRef: Firebase!
    
    func configure(joke : Joke)  {
        
        
        imageViewJoke.frame = CGRectMake(25.0, 5.0, 90.0, 90.0);
        imageViewJoke.layer.cornerRadius = imageViewJoke.frame.size.width / 2.0;
//        imageViewJoke.image = [UIImage imageNamed:@"UserPicPlaceHolder"];
        imageViewJoke.contentMode = UIViewContentMode.ScaleAspectFill;
        imageViewJoke.clipsToBounds = true;
        imageViewJoke.layer.masksToBounds = true;
        imageViewJoke.layer.borderWidth = 2.0;
        imageViewJoke.layer.borderColor = IMPACT_GRAY.CGColor
        self.maskView?.addSubview(imageViewJoke)
        
        self.name?.text = joke.jokesName
        self.country?.text = "Country is: \(joke.jokesCountry)"
        self.age?.text = joke.jokesAge
        
        let decodedData = NSData(base64EncodedString: joke.jokeImages, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
        let decodedImage = UIImage(data: decodedData!)
        self.imageViewJoke?.image = decodedImage

        
        
//        self.imageViewJoke?.image = loadImageFromPath(joke.jokeImages)
        
//        func saveImage (image: UIImage, path: String ) -> Bool{
//            
//            let pngImageData = UIImagePNGRepresentation(image)
//            //let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
//            let result = pngImageData!.writeToFile(path, atomically: true)
//            
//            return result
//            
//        }
        
       
                
        

        
//        self.imageViewJoke?.image = joke.jokeImages
//        print(String(joke.jokesAge))
        
        let ref = DataService.dataService.JokeRef
        
//        ref.observeEventType(.Value, withBlock: { snapshot in
//            let m = snapshot.value.objectForKey("age") as? NSInteger
//            self.age.text = String(m)
//            print(m)
//            }, withCancelBlock: { error in
//                print(error.description)
//        })
        
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
//            print("start")
//            print(snapshot.value.objectForKey("image"))
//            print("finish")
            
        })
        
    }
    

    

}
