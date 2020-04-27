import UIKit
protocol ColorPickerDelegate{
    func setText(_ text:String)
}
class ColorPickerViewController: UIViewController {

    var delegate: ColorPickerDelegate?
    
    @IBOutlet weak var pickedColorLabel: UILabel!
   
    var pickedColor: ColorPallete?
    var mainText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickedColorLabel.text = pickedColor?.selectedDescription
        pickedColorLabel.textColor = pickedColor?.rgb
    }

    @IBAction func greenSelected(){
        pickedColor = .green
        mainText = (pickedColor?.selectedDescription ?? "")
        delegate?.setText(mainText)
    }
    @IBAction func blueSelected(){
        pickedColor = .blue
        mainText = (pickedColor?.selectedDescription ?? "")
        delegate?.setText(mainText)
    }
    @IBAction func redSelected(){
        pickedColor = .red
        mainText = (pickedColor?.selectedDescription ?? "")
        delegate?.setText(mainText)
    }
    
    
    
}
