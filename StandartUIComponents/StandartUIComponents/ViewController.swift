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
        if currentIndex <= 9 && currentIndex >= 0{
            MainImageView.image = currentImage[currentIndex]}
        else {currentIndex -= 1}
    }
    
    @IBAction func previousButtonPressed(){
        currentIndex -= 1
        if currentIndex <= 9 && currentIndex >= 0{
            MainImageView.image = currentImage[currentIndex]}
        else {currentIndex += 1}
        }

}

