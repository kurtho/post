//
//  ViewController.swift
//  FileTest
//
//  Created by KurtHo on 2016/6/14.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!


    
    override func viewDidLoad() {
        let image1 = UIImage(named: "123")
        imageView.image = image1
//        super.viewDidLoad()
//        let path = NSBundle.mainBundle().pathForResource("Poem", ofType: "txt")
//        let idolFile = NSHomeDirectory().stringByAppendingString("/idols.txt")
////        print("idolFile \(idolFile)")
//        let array: NSArray = ["蘇東坡", "白居易", "杜甫"]
//        array.writeToFile(idolFile, atomically: true)
//        
//        do {
//            let contentString = try NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
////            print(contentString)
//            
//        } catch {
//            print(error)
//        }
        /*
        let fileManager = NSFileManager.defaultManager()
        let paths = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let url = paths.first?.URLByAppendingPathComponent("idol2.txt")
        
        let array2: NSArray = ["Daniel", "Alex"]
        array2.writeToURL(url!, atomically: true)
        
        
        print("url: \(url)")
 
        let paths2 = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path2 = paths2.first?.stringByAppendingString("/idol3.txt")
        print("path2 \(paths2)")
        
        do {
            try "Super".writeToFile(path2!, atomically: true, encoding: NSUTF8StringEncoding)
        } catch {
            print(error)
        }
        */
        //寫入
        let bundlePlist = NSBundle.mainBundle().pathForResource("Setting", ofType: "plist")
        let homePlist = NSHomeDirectory().stringByAppendingString("/Documents/Setting.plist")
        let fileManager = NSFileManager.defaultManager()
        
        if !fileManager.fileExistsAtPath(homePlist) {
            print("copy")
            //↑if the file does not exist (if else )
            //copy list
            
            do {
            try fileManager.copyItemAtPath(bundlePlist!, toPath: homePlist)
            } catch {
                print(error)
            }
        }
        
        //Read
        let homeDic = NSMutableDictionary(contentsOfFile: homePlist)
        let color = homeDic!["ColorTheme"]
        print("color: \(color)")
        
        
        
        
        //Modify setting
        homeDic?.setValue("Blue", forKey: "ColorTheme")
        homeDic?.setValue("0912345678", forKey: "PhoneNumber")
        
        
        
        //Write setting
        homeDic?.writeToFile(homePlist, atomically: true)
        
        
        
        
        
        
        
//        print("Home: \(NSHomeDirectory())")
//        print("Temp: \(NSTemporaryDirectory())")
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

