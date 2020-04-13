import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var x1TextField: UITextField!
    @IBOutlet weak var x2TextField: UITextField!
    @IBOutlet weak var operatorTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    

    @IBAction func donePressed(){
        let a = Double(x1TextField.text ?? "")
        let b = Double(x2TextField.text ?? "")
        
        enum Operator: String{
            case add = "+"
            case sub = "-"
            case div = "/"
            case mult = "*"
        
            func apply(_ a: Double, _ b: Double) -> Double {
        
        switch self {
                case .add:
                    let result = a + b
                    return result
                case .sub:
                    let result = a - b
                    return result
                case .div:
                    let result = a / b
                    return result
                case .mult:
                    let result = a * b
                    return result
                }
            }
        }
            if a != nil && b != nil{
                guard let unwrappedA:Double = a else {return}
                guard let unwrappedB:Double = b else {return}
                
                guard let op:String = operatorTextField.text else {return}
                if  let operation = Operator(rawValue: op){
                    switch operation {
                    case .add:
                        let res = operation.apply(unwrappedA, unwrappedB)
                        resultLabel.text = "\(unwrappedA) + \(unwrappedB) = \(res)"
                    case .sub:
                        let res = operation.apply(unwrappedA, unwrappedB)
                        resultLabel.text = "\(unwrappedA) - \(unwrappedB) = \(res)"
                        case .div:
                            let res = operation.apply(unwrappedA, unwrappedB)
                            resultLabel.text = "\(unwrappedA) / \(unwrappedB) = \(res)"
                        case .mult:
                            let res = operation.apply(unwrappedA, unwrappedB)
                            resultLabel.text = "\(unwrappedA) * \(unwrappedB) = \(res)"
                    }
                }
                else{
                    resultLabel.text = "Operator can be only: +, -, *, /"
                }
            }
                
            else{
                resultLabel.text = "x1 and x2 can be only numbers"
            }
    }
    
}

