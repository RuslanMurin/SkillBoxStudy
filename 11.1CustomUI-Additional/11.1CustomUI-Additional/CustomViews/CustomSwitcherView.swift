import UIKit

@IBDesignable
class CustomSwitcherView: UIView {

    @IBOutlet weak var switcherButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!{
        didSet{ if self.isSelected{ statusLabel.text = "ON"} else{ statusLabel.text = "OFF"}}
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: .zero, y: .zero, width: 100, height: 40))

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        frame = CGRect(x: .zero, y: .zero, width: 100, height: 40)
    }
    
    var isSelected: Bool = false

    override func layoutSubviews() {
        super.layoutSubviews()
        switcherButton.layer.cornerRadius = 15
        layer.cornerRadius = 20
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
            UIView.animate(withDuration: 0.5) {
                if self.isSelected == false {
                    self.backgroundColor = .systemIndigo
                    self.switcherButton.backgroundColor = .systemGreen
                    self.statusLabel.text = "ON"
                    self.statusLabel.textColor = .systemGreen
                    self.switcherButton.center.x += self.frame.width - self.switcherButton.frame.width - 10
                }
                else{
                    self.backgroundColor = .systemGray
                    self.switcherButton.backgroundColor = .darkGray
                    self.statusLabel.text = "OFF"
                    self.statusLabel.textColor = .white
                    self.switcherButton.center.x -= self.frame.width - self.switcherButton.frame.width - 10
                }
        }
        self.isSelected.toggle()
    }
    

    static func loadFromNIB() -> CustomSwitcherView{
        let nib = UINib(nibName: "CustomSwitcherView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! CustomSwitcherView
    }
}
