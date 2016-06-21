//
//  ViewController.swift
//  SwipeGestrue
//
//  Created by KurtHo on 2016/6/14.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var img: UIImageView!
    var position = 0
    var pics: Array = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    

    @IBAction func swipe(sender: UIGestureRecognizer) {
        print("swipe right")
        position += 1
        if position > 9 {
            position = 0
        }
        print("position = \(position)")
        self.img.image = UIImage(named: pics[position])

        
//        func respondToSwipeGesture(gesture: UIGestureRecognizer) {
//            
//            if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//                switch swipeGesture.direction {
//                case UISwipeGestureRecognizerDirection.Right:
//                    position += 1
//                    print("position = \(position)")
//                
//                case UISwipeGestureRecognizerDirection.Left:
//                    position -= 1
//                    print("position = \(position)")
//                default:
//                    break
//                }
//            }
//        }
    }
    
    

    @IBAction func swipeLeft(sender: UIGestureRecognizer) {
        print("swipe left")
        position -= 1
        if position < 0 {
            position = 9
        }
        print("position = \(position)")
        self.img.image = UIImage(named: pics[position])

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

