//
//  ViewController.swift
//  HomeProject1
//
//  Created by Ruslan Murin on 07.04.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "Insert Integer"
    }
    

    @IBAction func doneButton(_ sender: UIButton) {
        
        let temp = numberTextField.text
        let check = Int(temp ?? "Error")
        switch check {
        case is Int:            //возникает предупреждение, что всегда будет true(почему?)
            if numberLabel.text == "Insert Integer"{
                numberLabel.text = ""
            }
            let convert = String(check!)
            numberLabel.text! += convert
            numberLabel.text! += " "
       
        default:
            numberLabel.text = "Insert Integer"
        }
       
        
    }


}

