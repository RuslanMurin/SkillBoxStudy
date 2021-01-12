import UIKit
import CoreData
import RealmSwift

class TasksViewController: UIViewController {
    @IBOutlet weak var taskButton: UIButton!
    @IBOutlet weak var tasksTableView: UITableView!
    
    var taskStore: TaskStore?
    var isCoredata = false
<<<<<<< Updated upstream
    var tasks: [CoreTask]?
    var realmTasks: [Task]?
    
    
    func fetchTasks(_ isCoreData: Bool){
        
        if isCoredata{
            tasks = try! CoreDataSingleton.shared.persistentContainer?.viewContext.fetch(CoreTask.fetchRequest()) }
        
        else{ realmTasks = Array(try! Realm().objects(Task.self)) }
    }
=======
    var tasks: [Task]?
>>>>>>> Stashed changes
    
    func changeButton(){
        taskButton.setTitle("Load Tasks", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< Updated upstream
        fetchTasks(isCoredata)
        guard CoreDataSingleton.shared.persistentContainer != nil else { return changeButton() }
=======
        tasks = taskStore?.fetchAll() ?? nil
        guard tasks != nil else { return changeButton()
        }
        DispatchQueue.main.async { self.tasksTableView.reloadData() }
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
=======
        
        taskStore?.addTask()
        tasks = taskStore?.fetchAll()
        tasksTableView.reloadData()
        
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        taskStore?.removeTask(withKey: tasks?[sender.tag].key ?? "")

>>>>>>> Stashed changes
        tasksTableView.reloadData()
    }
    
    @IBAction func textEdited(_ sender: UITextField) {
<<<<<<< Updated upstream
        if isCoredata{
            taskStore?.editTask(withKey: tasks?[sender.tag].key ?? "", withText: sender.text ?? "New Task")}
        else{
            taskStore?.editTask(withKey: realmTasks?[sender.tag].taskID ?? "", withText: sender.text ?? "New Task")
        }
=======

        taskStore?.editTask(withKey: tasks?[sender.tag].key ?? "", withText: sender.text ?? "")
    
>>>>>>> Stashed changes
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskStore?.tasksCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        
<<<<<<< Updated upstream
        if isCoredata{ cell.taskTextField.text = taskStore?.taskText(withKey: tasks?[indexPath.row].key ?? "") }
        
        else{ cell.taskTextField.text = taskStore?.taskText(withKey: realmTasks?[indexPath.row].taskID ?? "") }
=======
        cell.taskTextField.text = taskStore?.taskText(withKey: tasks?[indexPath.row].key ?? "")
>>>>>>> Stashed changes
        
        cell.deleteButton.tag = indexPath.row
        cell.taskTextField.tag = indexPath.row
        return cell
    }
}
