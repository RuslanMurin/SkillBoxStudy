import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        deleteButton.endEditing(true)
    }
    
}
