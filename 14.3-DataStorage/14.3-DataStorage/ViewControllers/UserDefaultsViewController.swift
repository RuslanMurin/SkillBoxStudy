import UIKit

class UserDefaultsViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    
    let names: [UserDefaultsPersistence] = []
    
    static func storyboardInstance() -> UserDefaultsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "UserDefaults") as? UserDefaultsViewController ?? UserDefaultsViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for name in UserDefaultsPersistence.shared.allNames ?? [] {
            print(name.description)
        }
    }
    
    @IBAction func enterTapped(_ sender: UIButton) {
        addNames(name: nameTextField.text ?? "", lastName: lastnameTextField.text ?? "")
    }
    @IBAction func clearTapped(_ sender: Any) {
        UserDefaultsPersistence.shared.allNames = []
    }
    
    func addNames(name: String, lastName: String){
        if name != "" && lastName != ""{
            UserDefaultsPersistence.shared.allNames?.append("\(name) \(lastName)")
        }
    }
}
