//
//  AddViewController.swift
//  CoreDataDemo
//
//  Created by KurtHo on 2016/6/16.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet weak var textFieldIsbn: UITextField!
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldAuthor: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    
    
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var updateBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        if let book = updateBook {
            textFieldIsbn.text = book.isbn
            textFieldTitle.text = book.title
            textFieldAuthor.text = book.author
            if book.price == nil {
               return book.price = 0
            }
            textFieldPrice.text = "\(book.price!)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveBook(sender: AnyObject) {
        if updateBook == nil {
           updateBook = NSEntityDescription.insertNewObjectForEntityForName("Book", inManagedObjectContext: managedObjectContext)  as? Book
        } else {
            
        }
        
//        let book = NSEntityDescription.insertNewObjectForEntityForName("Book", inManagedObjectContext: managedObjectContext)  as! Book
        
        updateBook!.isbn = textFieldIsbn.text
        updateBook!.author = textFieldAuthor.text
        updateBook!.title = textFieldTitle.text
        
        let formatter = NSNumberFormatter()
        formatter.generatesDecimalNumbers = true
        updateBook!.price = formatter.numberFromString(textFieldPrice.text!) as? NSDecimalNumber
        
        appDelegate.saveContext()
        
        //在nav結束後，會直接出現↓↓↓
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
