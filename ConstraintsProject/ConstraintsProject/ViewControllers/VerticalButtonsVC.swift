//
//  VerticalButtonsVC.swift
//  ConstraintsProject
//
//  Created by Ruslan Murin on 04.05.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class VerticalButtonsVC: UIViewController {

    
    @IBOutlet weak var allHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allHeightConstraint.constant = self.view.frame.height / 2

    }
}
