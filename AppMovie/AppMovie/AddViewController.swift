//
//  AddViewController.swift
//  AppMovie
//
//  Created by KurtHo on 2016/6/17.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var content: UILabel!
    var count = 0
    
//    var viewImage: UIImageView?
//    var imageName: String?
    var pics: MoviesList!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            imageView.image = UIImage(named: pics.name)
            content.text = pics.content
//            moviesTitle.title = pics.name
        self.title = pics.name
        
//        self.imageView = UIImageView(image: UIImage(named: imageName!))

    
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
