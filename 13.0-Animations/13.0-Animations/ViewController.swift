import UIKit

enum Animation: String {
    case background = "1"
    case move = "2"
    case rounding = "3"
    case rotate = "4"
    case alpha = "5"
    case size = "6"
    case repeating = "7"
    
    mutating func previous() {
        switch self {
        case .background:
            self = .background
        case .move:
            self = .background
        case .rounding:
            self = .move
        case .rotate:
            self = .rounding
        case .alpha:
            self = .rotate
        case .size:
            self = .alpha
        case .repeating:
            self = .size
        }
    }
    
    mutating func next() {
        switch self {
        case .background:
            self = .move
        case .move:
            self = .rounding
        case .rounding:
            self = .rotate
        case .rotate:
            self = .alpha
        case .alpha:
            self = .size
        case .size:
            self = .repeating
        case .repeating:
            self = . repeating
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var squareTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var squareCenterHorisontalyConstraint: NSLayoutConstraint!
    
    var currentAnimation = Animation.background
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = currentAnimation.rawValue
    }
    
    
    @IBAction func previousTapped(_ sender: UIButton) {
        currentAnimation.previous()
        animate()
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        currentAnimation.next()
        animate()
    }
    
    func animate() {
        squareView.layer.removeAllAnimations()
        numberLabel.text = currentAnimation.rawValue
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
        let reverseAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
        switch currentAnimation {
        case .background:
            animator.addAnimations{
                self.squareView.backgroundColor = .systemYellow
            }
            animator.addCompletion { _ in
                reverseAnimator.addAnimations{
                    self.squareView.backgroundColor = .systemRed
                }
                reverseAnimator.startAnimation()
            }
            animator.startAnimation()
        case .move:
            self.squareTopConstraint.constant = 0
            self.squareCenterHorisontalyConstraint.constant = self.view.frame.size.width / 2 - 50
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.view.layer.layoutIfNeeded()
            }, completion: { _ in
                self.squareTopConstraint.constant = 80
                self.squareCenterHorisontalyConstraint.constant = 0
            })
        case .rounding:
            animator.addAnimations {
                self.squareView.layer.cornerRadius = self.squareView.frame.size.width / 2
            }
            animator.addCompletion { _ in
                reverseAnimator.addAnimations{
                    self.squareView.layer.cornerRadius = 0
                }
                reverseAnimator.startAnimation()
            }
            animator.startAnimation()
        case .rotate:
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }, completion: { _ in
                self.squareView.transform = .identity
            })
        case .alpha:
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.squareView.alpha = 0
            }, completion: { _ in self.squareView.alpha = 1} )
        case .size:
            UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
                self.squareView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)}, completion: { _ in
                    self.squareView.transform = .identity
            })
        case .repeating:
            UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }, completion: { _ in
                self.squareView.transform = .identity
            })
        }
    }
}

