import UIKit

class ThirdViewController: UIViewController {

    private var switcherVC: ColorSwitcherController?
    
    var thirdTempColor = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ColorSwitcherController, segue.identifier == "EmbedSwitcher"{
            switcherVC = vc
            vc.delegate = self
        }
    }
    
    @IBAction func changeSwitcherBackToGreen(){
        thirdTempColor = "Green"
        switcherVC?.switcherColor = thirdTempColor
    }
    @IBAction func changeSwitcherBackToYellow(){
        thirdTempColor = "Yellow"
        switcherVC?.switcherColor = thirdTempColor
    }
    @IBAction func changeSwitcherBackToPurple(){
        thirdTempColor = "Purple"
        switcherVC?.switcherColor = thirdTempColor
    }
    
}

extension ThirdViewController: ColorSwitcherDelegate{
    func setColor(_ backGroundColor: String) {
        switch switcherVC?.switcherTempColor{
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

