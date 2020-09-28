import UIKit

@IBDesignable
class CustomSwitcherView: UIView {
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var switcherButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!{
        didSet{ if self.isSelected{ statusLabel.text = "ON"} else{ statusLabel.text = "OFF"}}
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 120, height: 40)
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: .zero, y: .zero, width: 120, height: 40))
        layer.cornerRadius = 20
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        frame = CGRect(x: .zero, y: .zero, width: 120, height: 40)
        layer.cornerRadius = 20
        
    }
    
    var isSelected: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switcherButton.layer.cornerRadius = 15
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            self.leadingConstraint.isActive.toggle()
            self.trailingConstraint.isActive.toggle()
            if self.isSelected == false {
                self.backgroundColor = .systemIndigo
                self.switcherButton.backgroundColor = .systemGreen
                self.statusLabel.text = "ON"
                self.statusLabel.textColor = .systemGreen
            }
            else{
                self.backgroundColor = .systemGray
                self.switcherButton.backgroundColor = .darkGray
                self.statusLabel.text = "OFF"
                self.statusLabel.textColor = .white
            }
        }
        self.isSelected.toggle()
    }
    
    
    static func loadFromNIB() -> CustomSwitcherView{
        let nib = UINib(nibName: "CustomSwitcherView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! CustomSwitcherView
    }
}
