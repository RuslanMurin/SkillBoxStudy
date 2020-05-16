import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MainImageView: UIImageView!
    var currentImage = ImageContainer
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

