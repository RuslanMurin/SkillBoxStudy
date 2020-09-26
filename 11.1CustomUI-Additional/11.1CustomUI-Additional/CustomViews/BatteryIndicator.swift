import UIKit
@IBDesignable
class BatteryIndicator: UIView {
    
    @IBInspectable var charge: Int = 19
    
    override func draw(_ rect: CGRect) {
        let percent = self.frame.width / 100 * CGFloat(charge)
        var pathColor: UIColor = .red
        
        switch self.charge {
        case ...25:
            pathColor = .red
        case 26...80:
            pathColor = .orange
        case 80...:
            pathColor = .systemGreen
        default:
            break
        }
        let batteryBezier = UIBezierPath()
        batteryBezier.move(to: CGPoint(x: 2, y: 2))
        batteryBezier.addLine(to: CGPoint(x: self.frame.width - 10, y: 2))
        batteryBezier.addLine(to: CGPoint(x: self.frame.width - 10, y: self.frame.height / 2 - 10))
        batteryBezier.addLine(to: CGPoint(x: self.frame.width - 2, y: self.frame.height / 2 - 10))
        batteryBezier.addLine(to: CGPoint(x: self.frame.width - 2, y: self.frame.height / 2 + 10))
        batteryBezier.addLine(to: CGPoint(x: self.frame.width - 10, y: self.frame.height / 2 + 10))
        batteryBezier.addLine(to: CGPoint(x: self.frame.width - 10, y: self.frame.height - 2))
        batteryBezier.addLine(to: CGPoint(x: 2, y: self.frame.height - 2))
        batteryBezier.close()
        UIColor.black.setStroke()
        batteryBezier.lineWidth = 4
        batteryBezier.stroke()
        batteryBezier.addClip()
        
        
        
        let pathRect = CGRect(x: 4, y: 4, width: percent, height: self.frame.height - 8)
        let path = UIBezierPath(rect: pathRect)
        let color: UIColor = pathColor
        color.setFill()
        path.fill()

    }
}
