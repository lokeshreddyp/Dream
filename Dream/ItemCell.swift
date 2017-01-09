//
//  ItemCell.swift
//  Dream
//
//  Created by lokeshreddy on 1/7/17.
//  Copyright © 2017 lokeshreddy. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    
    @IBOutlet weak var tittle: UILabel!
    
    
    @IBOutlet weak var details: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    func configureCell(item : Item) {
        tittle.text = item.tittle
        details.text = item.details
        price.text = "$\(item.price)"
        thumb.image = item.toImage?.image as! UIImage?
    }
    
}
