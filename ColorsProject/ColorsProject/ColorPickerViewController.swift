import UIKit
protocol ColorPickerDelegate{
    func setText(_ text:String)
}
class ColorPickerViewController: UIViewController {

    var delegate: ColorPickerDelegate?
    
    @IBOutlet weak var pickedColorLabel: UILabel!
    var pickedColor = ""
    var textColor = ""
    var mainText = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        pickedColorLabel.text = pickedColor
        
        switch textColor {
            case "Green":
                pickedColorLabel.textColor = .green
            case "Blue":
                pickedColorLabel.textColor = .blue
            case "Red":
                pickedColorLabel.textColor = .red
        default:
            return
        }
    }
    
    @IBAction func greenSelected(){
        mainText = "Green color selected"
        delegate?.setText(mainText)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func blueSelected(){
        mainText = "Blue color selected"
        delegate?.setText(mainText)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func redSelected(){
        mainText = "Red color selected"
        delegate?.setText(mainText)
        dismiss(animated: true, completion: nil)
    }
    
}
