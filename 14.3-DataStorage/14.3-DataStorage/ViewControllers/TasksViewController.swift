import UIKit
import CoreData
import RealmSwift

class TasksViewController: UIViewController {
    @IBOutlet weak var taskButton: UIButton!
    @IBOutlet weak var tasksTableView: UITableView!
    
    var taskStore: TaskStore?
    var isCoredata = false
    var tasks: [CoreTask]?
    var realmTasks: [Task]?
    
    
    func fetchTasks(_ isCoreData: Bool){
        
        if isCoredata{
            tasks = try! CoreDataSingleton.shared.persistentContainer?.viewContext.fetch(CoreTask.fetchRequest()) }
        
        else{ realmTasks = Array(try! Realm().objects(Task.self)) }
    }
    
    func changeButton(){
        taskButton.setTitle("Load Tasks", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTasks(isCoredata)
        guard CoreDataSingleton.shared.persistentContainer != nil else { return changeButton() }
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
        if CoreDataSingleton.shared.persistentContainer == nil{
            CoreDataSingleton.shared.initialize()
            fetchTasks(isCoredata)
            tasksTableView.reloadData()
            taskButton.setTitle("New Task", for: .normal)
        }
        
        else{
            taskStore?.addTask()
            fetchTasks(isCoredata)
            tasksTableView.reloadData()
        }
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        if isCoredata{
            taskStore?.removeTask(withKey: tasks?[sender.tag].key ?? "")
        }
        else{
            taskStore?.removeTask(withKey: realmTasks?[sender.tag].taskID ?? "")
        }
        fetchTasks(isCoredata)
        tasksTableView.reloadData()
    }
    
    @IBAction func textEdited(_ sender: UITextField) {
        if isCoredata{
            taskStore?.editTask(withKey: tasks?[sender.tag].key ?? "", withText: sender.text ?? "New Task")}
        else{
            taskStore?.editTask(withKey: realmTasks?[sender.tag].taskID ?? "", withText: sender.text ?? "New Task")
        }
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskStore?.tasksCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        
        if isCoredata{ cell.taskTextField.text = taskStore?.taskText(withKey: tasks?[indexPath.row].key ?? "") }
        
        else{ cell.taskTextField.text = taskStore?.taskText(withKey: realmTasks?[indexPath.row].taskID ?? "") }
        
        cell.deleteButton.tag = indexPath.row
        cell.taskTextField.tag = indexPath.row
        return cell
    }
}
