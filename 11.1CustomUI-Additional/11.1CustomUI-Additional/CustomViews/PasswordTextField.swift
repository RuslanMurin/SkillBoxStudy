import UIKit
@IBDesignable
class PasswordTextField: UIView {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    var symbolsCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        var fillColor: UIColor
        var pathLenght: CGFloat
        
        switch self.symbolsCount {
        case 0...5:
            fillColor = .red
            pathLenght = self.layer.frame.width / 4
        case 6...10:
            fillColor = .orange
            pathLenght = self.layer.frame.width / 2
        case 11...:
            fillColor = .systemGreen
            pathLenght = self.layer.frame.width
        default:
            fillColor = .red
            pathLenght = self.layer.frame.width / 4
        }
        
        let pathRect = CGRect(x: 0, y: textField.frame.height + 5, width: self.frame.width, height: 10)
        let path = UIBezierPath(rect: pathRect)
        let color: UIColor = .lightGray
        color.setFill()
        path.fill()
        
        let pathRect3 = CGRect(x: 0, y: textField.frame.height + 5, width: pathLenght, height: 10)
        let path3 = UIBezierPath(rect: pathRect3)
        let color3: UIColor = fillColor
        color3.setFill()
        path3.fill()
    }
    
    @IBAction func textFieldEdited(_ sender: UITextField) {
        if let count = textField.text?.count{
            self.symbolsCount = count
            switch count {
            case 1...5:
                statusLabel.textColor = .red
                statusLabel.text = "Пароль слишком короткий, добавьте символов"
            case 6...10:
                statusLabel.textColor = .orange
                statusLabel.text = "Пароль слишком короткий, добавьте символов"
            case 11...:
                statusLabel.textColor = .systemGreen
                statusLabel.text = "Надежный пароль"
            default:
                statusLabel.textColor = .black
                statusLabel.text = "Введите пароль"
            }
        }
        setNeedsDisplay()
    }
    
    static func loadFromNIB() -> PasswordTextField{
        let nib = UINib(nibName: "PasswordTextField", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! PasswordTextField
    }
}
