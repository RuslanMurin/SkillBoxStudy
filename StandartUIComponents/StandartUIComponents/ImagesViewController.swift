import UIKit

class ImagesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let greetLabel = UILabel(frame: CGRect(x: 20, y: 44, width: 374, height: 86))
        greetLabel.backgroundColor = .red
        greetLabel.text = "Four random Images"
        greetLabel.textAlignment = .center
        self.view.addSubview(greetLabel)
        
                for index in 0...1{
            if let randomImage = ImageContainer.randomElement(){
            let imageView = UIImageView(frame: CGRect(x: 20 + (194 * index) , y: 144 + (339*index), width: 180, height: 325))
                imageView.image = randomImage
                imageView.clipsToBounds = true
                self.view.addSubview(imageView)
                    }
            if let secondRandomImage = ImageContainer.randomElement(){
            let secondImageView = UIImageView(frame: CGRect(x: 20 + (194 * index), y: 483 - (339 * index), width: 180, height: 325))
                secondImageView.image = secondRandomImage
                secondImageView.clipsToBounds = true
                self.view.addSubview(secondImageView)
                    }
        }
    }
}

