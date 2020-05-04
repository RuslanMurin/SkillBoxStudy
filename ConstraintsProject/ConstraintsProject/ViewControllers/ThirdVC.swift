//
//  ThirdVC.swift
//  ConstraintsProject
//
//  Created by Ruslan Murin on 04.05.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var switchPosition = true
    func switcher(_ switcher: Bool){
        var switcher = switcher
        switcher = !switcher
        heightConstraint.constant = switcher ? 230 : 21
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        heightConstraint.constant = 230
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        switcher(switchPosition)
        switchPosition = !switchPosition
    }
}
