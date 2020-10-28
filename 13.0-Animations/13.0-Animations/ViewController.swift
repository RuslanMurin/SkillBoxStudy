import UIKit

class Actions{
    let actionsArray: [String] = ["1","2","3","4","5","6","7"]
    var currentIndex: Int = 0{
        didSet{
            if currentIndex < 0 { currentIndex = 0 }
            else if currentIndex > 6 { currentIndex = 6 }
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var squareTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var squareCenterHorisontalyConstraint: NSLayoutConstraint!
    
    let action = Actions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = action.actionsArray[action.currentIndex]
    }
    
    
    @IBAction func previousTapped(_ sender: UIButton) {
        action.currentIndex -= 1
        numberLabel.text = action.actionsArray[action.currentIndex]
        animate(actionIndex: action.currentIndex)
        print(action.currentIndex)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        action.currentIndex += 1
        numberLabel.text = action.actionsArray[action.currentIndex]
        animate(actionIndex: action.currentIndex)
        print(action.currentIndex)
    }
    
    func animate(actionIndex: Int){
        switch actionIndex {
        case 0:
            squareView.layer.removeAllAnimations()
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.squareView.backgroundColor = .systemYellow
            }, completion: { (isCompleted) in self.squareView.backgroundColor = .systemRed })
        case 1:
            squareView.layer.removeAllAnimations()
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.squareTopConstraint.constant = 0
                self.squareCenterHorisontalyConstraint.constant = self.view.frame.size.width / 2 - 50
                self.view.layer.layoutIfNeeded()
            }, completion: { (isCompleted) in self.squareTopConstraint.constant = 80
                self.squareCenterHorisontalyConstraint.constant = 0
                self.view.layer.layoutIfNeeded()
            })
        case 2:
            squareView.layer.removeAllAnimations()
            let animation = CABasicAnimation(keyPath: "cornerRadius")
            animation.fromValue = NSNumber(value: 0)
            animation.toValue = NSNumber(value: Int(squareView.frame.size.width) / 2)
            animation.duration = 2.0
            animation.autoreverses = true
            squareView.layer.add(animation, forKey: "cornerRadius")
            squareView.layer.cornerRadius = 0
        case 3:
            squareView.layer.removeAllAnimations()
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }, completion: { (isCompleted) in
                self.squareView.transform = .identity
            })
        case 4:
            squareView.layer.removeAllAnimations()
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.squareView.alpha = 0
            }, completion: { (isCompleted) in self.squareView.alpha = 1} )
        case 5:
            squareView.layer.removeAllAnimations()
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.squareView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)}, completion: { (isCompleted) in
                self.squareView.transform = .identity
            })
        case 6:
            squareView.layer.removeAllAnimations()
            UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .curveLinear], animations: {
            self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }, completion: {(isCompleted) in
                self.squareView.transform = .identity
            })
        default:
            break
        }
    }
    
}

