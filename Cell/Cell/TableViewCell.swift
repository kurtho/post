//
//  TableViewCell.swift
//  Cell
//
//  Created by KurtHo on 2016/6/3.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var DescribtionLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //當cell被選到時要觸發的動作
        // Configure the view for the selected state
    }
    
}
