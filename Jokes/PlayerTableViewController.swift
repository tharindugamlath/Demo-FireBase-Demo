//
//  PlayerTableViewController.swift
//  Jokes
//
//  Created by Tharindu Gamlath on 5/30/16.
//  Copyright © 2016 Tharindu Gamlath. All rights reserved.
//

import UIKit
import Firebase

class PlayerTableViewController: UITableViewController {

    var jokes = [Joke]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ARSLineProgress.shown { return }
        
        ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
            print("Showed with completion block")
        }

        DataService.dataService.JokeRef.observeEventType(.Value, withBlock: { snapshot in
            
            // The snapshot is a current look at our jokes data.
            
            print(snapshot.value)
            
            self.jokes = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    
                    // Make our jokes array for the tableView.
                    
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let joke = Joke(key: key, dictionary: postDictionary)
                        
                        // Items are returned chronologically, but it's more fun with the newest jokes first.
                        
                        self.jokes.insert(joke, atIndex: 0)
                    }
                }
                
            }
            
            // Be sure that the tableView updates when there is new data.
            if self.jokes.count > 0 {
                 self.stopBar()
            }
            self.tableView.reloadData()
        })
    }
    
    func stopBar()  {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            ARSLineProgress.hideWithCompletionBlock({ () -> Void in
                print("Hidden with completion block")
            })
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jokes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let joke = jokes[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("JokeCell") as? PlayersTableViewCell {
            cell.configure(joke)
            return cell
        }
        else {
            return PlayersTableViewCell()
        }

        
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.alpha = 0;
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        UIView.animateWithDuration(1.0){
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
