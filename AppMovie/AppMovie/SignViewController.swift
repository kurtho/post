//
//  SignViewController.swift
//  AppMovie
//
//  Created by KurtHo on 2016/6/17.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class SignViewController: UIViewController {
    @IBOutlet weak var signTextField: UITextField!
    
    @IBOutlet weak var sginButton: UIButton!
    
//    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var contentLabel: UILabel!

    func setup() {
        signTextField.text = nil
    }

    
    
    @IBAction func signAtcion(sender: AnyObject) {
        let field = signTextField.text
        
        if field == "" {
            let alert = UIAlertController(title: "你要寫字啦!!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return 
        } else {
//            signTextField.text = "\(field!,Character())"

        return setup()
        }
    
        
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
