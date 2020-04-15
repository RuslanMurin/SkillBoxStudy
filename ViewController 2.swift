//
//  ViewController.swift
//  HomeProject2
//
//  Created by Ruslan Murin on 08.04.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var x1TextField: UITextField!
    @IBOutlet weak var operatorTextField: UITextField!
    @IBOutlet weak var x2TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func donePressed(_ sender: UIButton) {
        let x1temp = Int(x1TextField.text ?? "Error")
        let x2temp = Int(x2TextField.text ?? "Error")
        let operatorTemp = operatorTextField.text
        
        if x1temp != nil && x2temp != nil{
            switch operatorTemp {
            case "-":
                let res = x1temp! - x2temp!
                resultLabel.text = "\(String(describing: x1temp)) - \(String(describing: x2temp)) = \(res)"
                
            case "+":
                let res = x1temp! + x2temp!
                resultLabel.text = "\(String(describing: x1temp)) + \(String(describing: x2temp)) = \(res)"
             
            case "/":
                let res = x1temp! / x2temp!
                resultLabel.text = "\(String(describing: x1temp)) / \(String(describing: x2temp)) = \(res)"
            case "*":
                let res = x1temp! * x2temp!
                resultLabel.text = "\(String(describing: x1temp)) * \(String(describing: x2temp)) = \(res)"
                
            default:
                resultLabel.text = "Operator can be only: /, *, +, -"
            }
        }
        else{
            resultLabel.text = "Enter only Integer in x1 and x2"
        }
    }
    
}
//вопрос: при корректном выполнении приограмма выводит: Optional(9) и т.п. как это исправить?
