//
//  FirstViewController.swift
//  Notification
//
//  Created by KurtHo on 2016/6/13.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {


    
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FirstViewController.updateLabel), name: "Notif1", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FirstViewController.updateLabel2), name: "Notif2", object: nil)
    }

    
    
    
    @IBAction func click(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("Notif2", object: "123456")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tapToDisKey(sender: AnyObject) {
        self.view.endEditing(true)
    }

    
    func updateLabel(notification: NSNotification) {
        messageLabel.text = "Hello"
    }
    
    func updateLabel2(notification: NSNotification) {
        messageLabel.text = "Helloooo" + (notification.object as! String)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            print("touchBegan - \(touch)")
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchMoved")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            print("touchEnd - \(touch)")
        }
    }
    

    
    
    
    
}
