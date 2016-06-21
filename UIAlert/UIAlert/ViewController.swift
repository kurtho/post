//
//  ViewController.swift
//  UIAlert
//
//  Created by KurtHo on 2016/6/13.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func showAlert(sender: AnyObject) {
        let alert = UIAlertController(title: "Alert Title", message:
        "Alert Message", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { UIAlertAction in self.performSegueWithIdentifier("show", sender: nil)
        }
        
        alert.addAction(okAction)
        
        let okAction1 = UIAlertAction(title: "OK1", style: .Default, handler: nil)
        alert.addAction(okAction1)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

