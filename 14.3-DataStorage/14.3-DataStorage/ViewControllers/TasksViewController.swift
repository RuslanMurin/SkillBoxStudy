import UIKit
import Alamofire
import RealmSwift

class TasksViewController: UIViewController {
    @IBOutlet weak var tasksTableView: UITableView!
    
    var delegate: Persistence?
    
    private let realm = try! Realm()
    
    static func storyboardInstance() -> TasksViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "Tasks") as? TasksViewController ?? TasksViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func addTask(_ sender: Any) {
        delegate?.addTask()
        tasksTableView.reloadData()
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        delegate?.removeTask(withIndex: sender.tag)
        tasksTableView.reloadData()
    }
    
    @IBAction func textEdited(_ sender: UITextField) {
        delegate?.editTask(withIndex: sender.tag, withText: sender.text ?? "")
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.tasksCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell

        cell.taskTextField.text = delegate?.taskText(withIndex: indexPath.row)
        cell.deleteButton.tag = indexPath.row
        cell.taskTextField.tag = indexPath.row
        
        return cell
    }
    

    
}
