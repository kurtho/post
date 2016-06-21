//
//  ViewController.swift
//  10.3~10.5
//
//  Created by KurtHo on 2016/6/13.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func click(sender: AnyObject) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service is not available", message: "Sorry, the call feature is not available yet. Please retry later", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
            let callAction = UIAlertAction(title: "Call" + " 123-0000", style: UIAlertActionStyle.Default, handler: callActionHandler)
        let isVisited = UIAlertAction(title: "I've been here befroe", style: .Default, handler: nil)
        
        optionMenu.addAction(isVisited)
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
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

