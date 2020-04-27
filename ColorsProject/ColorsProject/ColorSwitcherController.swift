import UIKit

protocol ColorSwitcherDelegate{
    func setColor(_ backGroundColor: String)
}


class ColorSwitcherController: UIViewController {
    
    var switcherTempColor = ""
    var switcherColor = ""{
        didSet{switch
        switcherColor{
        case "Green":
            view.backgroundColor = .green
        case "Yellow":
            view.backgroundColor = .yellow
        case "Purple":
            view.backgroundColor = .purple
            default:
            return
            }
        }
    }
    
    var delegate: ColorSwitcherDelegate?
    
    @IBAction func changeThirdBackToGreen(){
        switcherTempColor = "Green"
        delegate?.setColor(switcherTempColor)
    }
    @IBAction func changeThirdBackToYellow(){
        switcherTempColor = "Yellow"
        delegate?.setColor(switcherTempColor)
    }
    @IBAction func changeThirdBackToPurple(){
        switcherTempColor = "Purple"
        delegate?.setColor(switcherTempColor)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
