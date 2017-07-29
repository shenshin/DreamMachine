//
//  ItemCell.swift
//  DreamMachine
//
//  Created by Aleksandr Shenshin on 25.07.17.
//  Copyright © 2017 Aleksandr Shenshin. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    //@IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!

    
    func configureCell(item: Item) {
        title.text = item.title
        price.text = "\(item.price) ₽"
        details.text = item.details
    }    
}


