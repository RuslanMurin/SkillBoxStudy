import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "Insert Integer"
    }

    func clear(){
        if numberLabel.text == "Insert Integer"{
        numberLabel.text = ""
        }
    }
    
    @IBAction func donePressed(){
        let temp = Int(numberTextField.text ?? "")
        if temp == nil{
            numberLabel.text = "Insert Integer"
        }
        else{
            clear()
            guard let unwrapTemp:Int = temp else {return}
            let convert = String(NSDecimalNumber(decimal: pow(2, unwrapTemp)).intValue)
            numberLabel.text! += convert
            numberLabel.text! += " "
        }
    }
}
