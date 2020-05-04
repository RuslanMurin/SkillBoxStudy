//
//  StackViewVC.swift
//  ConstraintsProject
//
//  Created by Ruslan Murin on 04.05.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class StackViewVC: UIViewController {

    @IBOutlet weak var stackViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackViewHeightConstraint.constant = self.view.frame.height / 2
    }
}
