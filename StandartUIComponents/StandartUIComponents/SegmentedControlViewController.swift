import UIKit



class SegmentedControlViewController: UIViewController {

    @IBOutlet weak var mainSegmentedControl: UISegmentedControl!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainSegmentedControl.selectedSegmentIndex = 0
        greenView.isHidden = false
        blueView.isHidden = true
        purpleView.isHidden = true
    }
  
    @IBAction func choiceSegment(){
        switch mainSegmentedControl.selectedSegmentIndex {
        case 0:
            greenView.isHidden = false
            blueView.isHidden = true
            purpleView.isHidden = true
        case 1:
            greenView.isHidden = true
            blueView.isHidden = false
            purpleView.isHidden = true
        case 2:
            greenView.isHidden = true
            blueView.isHidden = true
            purpleView.isHidden = false
        default:
            return
        }
        
    }
    
}
