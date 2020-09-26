//
//  WeekTableViewCell.swift
//  12.0JSON
//
//  Created by Ruslan Murin on 02.09.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class WeekTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
