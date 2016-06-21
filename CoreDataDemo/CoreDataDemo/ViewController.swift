//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by KurtHo on 2016/6/16.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //↑appDelegate實作
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var bookList: [Book] = [Book]()
    @IBOutlet weak var tableViewBookList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewBookList.dataSource = self
        tableViewBookList.delegate = self
        reloadData()
        
        /*
    let book = NSEntityDescription.insertNewObjectForEntityForName("Book", inManagedObjectContext: managedObjectContext) as! Book
        
        book.isbn = "001"
        book.author = "author01"
        book.title = "title01"
        book.price = 100
         
        appDelegate.saveContext()
        
         //↓下面是load資料
        do {
        let fetchRequest = NSFetchRequest(entityName: "Book")
        let bookArray: [Book] = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Book]
            
            for book1 in bookArray {
                print("book1.isbn \(book1.isbn)")
            }
        } catch {
            print(error)
        }
        */
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reloadData() {
        do {
            let fetchRequest = NSFetchRequest(entityName: "Book")
                            //搬資料↑↑
            let sortDescriptor = NSSortDescriptor(key: "author", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptor]
            let sorDescriptor1 = NSSortDescriptor(key: "title", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptor, sorDescriptor1]
            
            bookList = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Book]
                            //搬東西出來，轉型，到[Book]陣列
            
            tableViewBookList.reloadData()
        } catch {
            print(error)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show detail" {
            let vc = segue.destinationViewController as! AddViewController
            vc.updateBook = bookList[(tableViewBookList.indexPathForSelectedRow?.row)!]
        }
    }
    

}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("show detail", sender: nil)
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            print("Delete")
            let book =  bookList[indexPath.row]
            managedObjectContext.deleteObject(book)
            appDelegate.saveContext()
            
            //刪除cell
//            tableViewBookList.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
            reloadData()
            //重讀才會-1
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = bookList[indexPath.row].title
        //   ↑內建的非客製
        cell.detailTextLabel?.text = bookList[indexPath.row].author
        //   ↑內建的非客製


        
        return cell
    }
}


