//
//  SecondScrollViewController.swift
//  10.1. Additional
//
//  Created by Ruslan Murin on 24.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class SecondScrollViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
