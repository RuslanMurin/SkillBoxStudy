import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testView = CustomSwitcherView.loadFromNIB()
        view.addSubview(testView)
        testView.backgroundColor = .systemGray
        testView.frame.origin = CGPoint(x: 50, y: 50)
        
        let passView = PasswordTextField.loadFromNIB()
        view.addSubview(passView)
        passView.frame = CGRect(x: 20, y: 100, width: 350, height: 100)
    }


}

