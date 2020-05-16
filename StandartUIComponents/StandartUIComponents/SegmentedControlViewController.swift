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
        for (index, el) in [greenView, blueView, purpleView].enumerated() {
            if mainSegmentedControl.selectedSegmentIndex == index{
                el?.isHidden = false
            }
            else { el?.isHidden = true}
        }
    }
}
