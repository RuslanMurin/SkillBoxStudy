//
//  MainTableViewCell.swift
//  UITableViewProject
//
//  Created by Ruslan Murin on 03.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var settingsIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
