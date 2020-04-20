import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var mainColorLabel: UILabel!
    @IBOutlet weak var tabBar: UITabBarItem!
    
    private var pickerVC: ColorPickerViewController?
    
    var mainColor = "Green color selected"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainColorLabel.text = mainColor
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? ColorPickerViewController, segue.identifier == "ShowColorPicker"{
            vc.pickedColor = mainColor
            pickerVC = vc
        vc.delegate = self
        switch mainColor {
        case "Green color selected":
            vc.textColor = "Green"
        case "Red color selected":
            vc.textColor = "Red"
        case "Blue color selected":
            vc.textColor = "Blue"
        default:
            return
        }
    }
}
    
}

extension SecondViewController: ColorPickerDelegate{
    func setText(_ text: String) {
        mainColor = (pickerVC?.mainText ?? "")
        mainColorLabel.text = mainColor
    }
}

