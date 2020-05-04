import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeFirstData(_ sender: Any) {
        firstLabel.text = firstTextField.text
    }
    @IBAction func changeSecondData(_ sender: Any) {
        secondLabel.text = secondTextField.text
    }
    

}
