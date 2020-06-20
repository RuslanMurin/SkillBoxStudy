import UIKit

class ViewController: UIViewController {

<<<<<<< HEAD

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainSlider: UISlider!
    @IBOutlet weak var mainStepper: UIStepper!
    
    var currentImage = ImageContainer.compactMap{ $0 }
=======
    @IBOutlet weak var MainImageView: UIImageView!
    var currentImage = ImageContainer
>>>>>>> master
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
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
    
    
=======
        MainImageView.image = currentImage[currentIndex]
    }

    @IBAction func nextButtonPressed(){
        currentIndex += 1
        guard currentIndex <= 9  else { return currentIndex -= 1 }
        MainImageView.image = currentImage[currentIndex]
    }
    
    @IBAction func previousButtonPressed(){
        currentIndex -= 1
        guard currentIndex >= 0 else { return currentIndex += 1 }
            MainImageView.image = currentImage[currentIndex]
        
    }
>>>>>>> master
}

