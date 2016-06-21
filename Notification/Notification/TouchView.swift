//
//  TouchView.swift
//  Notification
//
//  Created by KurtHo on 2016/6/13.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class TouchView: UIView {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("View touchBegan")
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self.superview)
        
        print("RabbitImageView touchesMoved \(point) ")
//        self.frame.origin = point!
        self.center = point!
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("View touchEnded")
    }
    

    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
