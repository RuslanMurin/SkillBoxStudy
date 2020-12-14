import UIKit
import Foundation

class UserDefaultsViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    
    let userDefaults = UserDefaultsPersistence.shared
    
    static func storyboardInstance() -> UserDefaultsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "UserDefaults") as? UserDefaultsViewController ?? UserDefaultsViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = userDefaults.name
        lastnameTextField.text = userDefaults.lastName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func nameChanged(_ sender: UITextField) {
        userDefaults.name = nameTextField.text ?? ""
    }
    
    @IBAction func lastNameChanged(_ sender: UITextField) {
        userDefaults.lastName = lastnameTextField.text ?? ""
    }
    
}
