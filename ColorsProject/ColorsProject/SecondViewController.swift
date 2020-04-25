import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var mainColorLabel: UILabel!
    @IBOutlet weak var tabBar: UITabBarItem!
    
    private var pickerVC: ColorPickerViewController?
    
    var mainColor = ColorPallete.green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainColorLabel.text = mainColor.selectedDescription
    }

    @IBAction func editPressed(_ unwindSegue: UIStoryboardSegue){
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? ColorPickerViewController, segue.identifier == "ShowColorPicker"{
        vc.pickedColor = mainColor
        pickerVC = vc
        vc.delegate = self
    }
  }
}

extension SecondViewController: ColorPickerDelegate{
    func setText(_ text: String) {
        mainColor = (pickerVC?.pickedColor ?? ColorPallete.green)
        mainColorLabel.text = mainColor.selectedDescription
    }
}

