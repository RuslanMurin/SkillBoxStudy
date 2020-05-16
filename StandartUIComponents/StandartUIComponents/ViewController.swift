import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainSlider: UISlider!
    @IBOutlet weak var mainStepper: UIStepper!
    
    var currentImage = ImageContainer.compactMap{ $0 }
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImageView.image = currentImage[0]
        mainSlider.value = 0
        animatorStarted()
    }
    
    
    //UIStepper вместо кнопок
    @IBAction func mainStepperChanged(_ sender: UIStepper) {
        currentIndex = Int(sender.value)
        mainImageView.image = currentImage[currentIndex]
    }
    
    //Блок для анимации
    
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    func animate(images: [UIImage]){
//        mainImageView.animationImages = images
//        mainImageView.animationDuration = Double(images.count) * 1.5
//        mainImageView.animationRepeatCount = 0
//        mainImageView.startAnimating()
    }
    func animatorStarted(){
        animator.addAnimations {
            self.mainImageView.image = self.currentImage[self.currentIndex]
            self.currentIndex += 1
        }
    }
    
    @IBAction func startPressed(){
        
        animator.startAnimation()
    }
    
    @IBAction func stopPressed(){
        
        mainImageView.stopAnimating()
    }
    
//UISlider
    @IBAction func mainSliderChanged(_ sender: UISlider) {
        
        currentIndex = Int(sender.value)
        mainImageView.image = currentImage[currentIndex]
    }
    
    
}

