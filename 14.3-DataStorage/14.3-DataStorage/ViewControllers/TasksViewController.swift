import UIKit
import CoreData
import RealmSwift

class TasksViewController: UIViewController {
    @IBOutlet weak var taskButton: UIButton!
    @IBOutlet weak var tasksTableView: UITableView!
    
    var taskStore: TaskStore?
    var isCoredata = false
    var tasks: [Task]?
    
    func changeButton(){
        taskButton.setTitle("Load Tasks", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = taskStore?.fetchAll() ?? nil
        guard tasks != nil else { return changeButton()
        }
        DispatchQueue.main.async { self.tasksTableView.reloadData() }
    }
    
    static func storyboardInstance() -> TasksViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "Tasks") as? TasksViewController ?? TasksViewController()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func addTask(_ sender: Any) {
        
        taskStore?.addTask()
        tasks = taskStore?.fetchAll()
        tasksTableView.reloadData()
        
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        taskStore?.removeTask(withKey: tasks?[sender.tag].key ?? "")

        tasksTableView.reloadData()
    }
    
    @IBAction func textEdited(_ sender: UITextField) {

        taskStore?.editTask(withKey: tasks?[sender.tag].key ?? "", withText: sender.text ?? "")
    
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskStore?.tasksCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        
        cell.taskTextField.text = taskStore?.taskText(withKey: tasks?[indexPath.row].key ?? "")
        
        cell.deleteButton.tag = indexPath.row
        cell.taskTextField.tag = indexPath.row
        return cell
    }
}
