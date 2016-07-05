//
//  AddPlayerViewController.swift
//  Jokes
//
//  Created by Tharindu Gamlath on 5/29/16.
//  Copyright © 2016 Tharindu Gamlath. All rights reserved.
//

import UIKit
import Firebase

class AddPlayerViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

     var currentUsername = ""
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var addImage: UIButton!
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var country: UITextField!
    
     let IMPACT_GRAY = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
    let IMPACT_BLUE = UIColor(red :0.0/255.0, green: 49.0/255.0,blue:180.0/255.0,alpha:1.0)
    let IMAPACT_RED =  UIColor(red:254.0/255.0,green:2.0/255.0,blue:0.0/255.0 ,alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
         imagePicker.delegate = self
        addImage.layer.cornerRadius = 5.0;
        addImage.layer.borderWidth = 1.0;
        addImage.layer.borderColor = IMAPACT_RED.CGColor;
        addImage.layer.backgroundColor = IMPACT_BLUE.CGColor
        addImage.layer.borderWidth = 2.0;
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddPlayerViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
//        self.title = "Create New"
//        self.textView.becomeFirstResponder()
//        self.navigationItem.rightBarButtonItem = self.doneBarButtonItem

        imgView.image = UIImage(named: "UserPicPlaceHolder")
        
        
        imgView.frame = CGRectMake(25.0, 5.0, 200.0, 200.0);
        imgView.layer.cornerRadius = imgView.frame.size.width / 2.0;
        //        imageViewJoke.image = [UIImage imageNamed:@"UserPicPlaceHolder"];
        imgView.contentMode = UIViewContentMode.ScaleAspectFill;
        imgView.clipsToBounds = true;
        imgView.layer.masksToBounds = true;
        imgView.layer.borderWidth = 2.0;
        imgView.layer.borderColor = IMPACT_GRAY.CGColor
        self.view.addSubview(imgView)
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func loadImage(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imgView?.image = pickedImage
            //imgView?.layer.cornerRadius = (pickedImage.size.width)/2
            imgView.contentMode = .ScaleAspectFit
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    
    @IBAction func addNew(sender: AnyObject) {
        
        let playerName = name.text
        let playerAge = age.text
        let playerCountry = country.text
        
        if playerName != "" || playerAge != "" || playerCountry != "" {
            
            var data: NSData = NSData()
            if let image = imgView.image {
                data = UIImageJPEGRepresentation(image,0.1)!
            }
            
            let img = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
            
            let newPlayer: Dictionary<String,AnyObject> = [
                "name":playerName!,
                "age":playerAge!,
                "country":playerCountry!,
                "image":img
                //            "author": currentUsername
            ]
            
            DataService.dataService.createNewJoke(newPlayer)
            if let navController = self.navigationController {
                navController.popViewControllerAnimated(true)
            }
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
