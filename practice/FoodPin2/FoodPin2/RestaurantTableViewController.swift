//
//  RestaurantTableViewController.swift
//  FoodPin2
//
//  Created by KurtHo on 2016/5/31.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

     var restaurantNames = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "thaicafe"]
    
     var restaurantImages = ["cafe deadend", "homei", "teakha", "cafe loisl", "petite oyster", "for kee restaurant", "po's atelier", "bourke street bakery", "haigh's chocolate", "palomino espresso", "upstate", "traif", "graham avenue meats", "waffle & wolf", "five leaves", "cafe lore", "confessional", "barrafina", "donostia", "royal oak", "thai cafe"]
    
     var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
     var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]

//    var image = Restaurants()，引用class的東西而不需要去產生一個質(Obj)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //  建立一個類似動作清單的選單
        
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        
        //  加入動作至選單中
        let cancelAction = UIAlertAction(title: "Cancel", style:  .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable.", message: "Sorry, the call feature is not available yet. Please retry later", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)",
                                       style: UIAlertActionStyle.Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        //  加入課本demo↓↓↓↓↓↓
        let isVisitedTitle = (restaurantIsVisited[indexPath.row]) ?   "Remove [I've been there]"    :   "I've been here"
        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: {
            (action: UIAlertAction) -> Void in
                                                
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            self.restaurantIsVisited[indexPath.row] = (self.restaurantIsVisited[indexPath.row]) ? false : true
            cell?.accessoryType = (self.restaurantIsVisited[indexPath.row]) ? .Checkmark : .None
        //  ↑↑↑↑↑↑↑
            }
        )
        
        
        //  ↓↓↓↓↓↓ 作業區，取消I've been here ↓↓↓↓↓↓
//        if restaurantIsVisited[indexPath.row] == true  {
//            let unVisitedAction = UIAlertAction(title: "Remove I've been here.", style: .Default,
//                                                handler:  {
//                                                    (action: UIAlertAction) -> Void in
//                                                    let cell = tableView.cellForRowAtIndexPath(indexPath)
//                                                    cell?.accessoryType = .None
//                }
//            )
//            optionMenu.addAction(unVisitedAction)
//        }
        //  ↑↑↑↑↑
        
        optionMenu.addAction(isVisitedAction)
        //  呈現選單
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    
    
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellIdentifier = "Cell"
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
//        
//        cell.nameLabel.text = .restaurantNames[indexPath.row]
//        cell.locationLabel.text = .restaurantLocations[indexPath.row]
//        cell.typeLabel.text = .restaurantTypes[indexPath.row]
//        cell.thumbnailImageView.image = UIImage(named: .restaurantNames[indexPath.row])
//        cell.thumbnailImageView.layer.cornerRadius = 30.0
//        cell.thumbnailImageView.clipsToBounds = true
//
//        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .Checkmark : .None
//        
//        //        效率縮寫↑↑↑↑↑
//        //        if restaurantIsVisited[indexPath.row] {
//        //            cell.accessoryType = .Checkmark
//        //        } else {
//        //            cell.accessoryType = .None
//        //        }
//        
//        return cell
//    }

//    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete  {
//            //從data source刪除列
//            restaurantNames.removeAtIndex(indexPath.row)
//            restaurantTypes.removeAtIndex(indexPath.row)
//            restaurantLocations.removeAtIndex(indexPath.row)
//            restaurantImages.removeAtIndex(indexPath.row)
//            restaurantIsVisited.removeAtIndex(indexPath.row)
//            
//            tableView.reloadData()
//            
//            }
//        
//        print("total item count:\(restaurantNames.count)")
//        for name in restaurantNames {
//            print(name)
//        }
//    }
    
//    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
//        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action, indexPath) -> Void in
//            
//            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
//            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
//            self.presentviewcontroller(activityController, animated: true, completion: nil)
//            
//    })
//      //刪除按鈕
//        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action, indexPath) -> Void in
//            self.restaurantNames.removeAtIndex(indexPath.row)
//            self.restaurantTypes.removeAtIndex(indexPath.row)
//            self.restaurantLocations.removeAtIndex(indexPath.row)
//            self.restaurantIsVisited.removeAtIndex(indexPath.row)
//            self.restaurantImages.removeAtIndex(indexPath.row)
//            
//        })
//        
//        return [deleteAction, shareAction]
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
