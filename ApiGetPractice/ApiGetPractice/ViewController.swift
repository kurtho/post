//
//  ViewController.swift
//  ApiGetPractice
//
//  Created by KurtHo on 2016/6/21.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBAction func loadFile(sender: AnyObject) {
        let urlString: String = "http://data.taipei/opendata/datalist/apiAccess"
        Alamofire.request(.GET, urlString, parameters: ["scope" : "resourceAquire", "rid": "1767eecc-affc-4929-b484-bd46c5d9d10d", "offset": "5", "limit": "30"])
            .responseJSON {
                response in
//                print("Response data: \(response.result.value)")
            
                if let data = response.result.value {
                    let json = JSON(data)
                    let houseList = json["result"]["results"].arrayValue
                    
                    for house in houseList {
                        print("house name \(house["stitle"].stringValue)")
                    }
                }
        }
        
    }
    
    @IBAction func loadFile2(sender: AnyObject) {
        let urlString: String = "http://data.taipei/opendata/datalist/apiAccess"
        Alamofire.request(.GET, urlString, parameters: ["scope" : "resourceAquire", "rid": "36847f3f-deff-4183-a5bb-800737591de5", "offset" : "310", "limit" : "310" ]).responseJSON {
            response in
            if let data = response.result.value {
                let json = JSON(data)
                let viewList = json["result"]["results"].arrayValue
                
                for view in viewList {
                    print("house name \(view["stitle"].stringValue)")
                    
            }
        }
    }
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


