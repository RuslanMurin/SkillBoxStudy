import UIKit

class TasksViewController: UIViewController {
    @IBOutlet weak var tasksTableView: UITableView!
    
    var loadMoreStatus = false
    var taskStore: TaskStore?
    var data = [Task]()
    static func storyboardInstance() -> TasksViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "Tasks") as? TasksViewController ?? TasksViewController()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RealmPersistence.shared.fetchData(completion: {[weak self] result in
            switch result{
            case .success(let data):
                self?.data.append(contentsOf: data)
                DispatchQueue.main.async{
                    self?.tasksTableView.reloadData()}
            case .failure(_): break
            }
        })
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func addTask(_ sender: Any) {
        taskStore?.addTask()
        tasksTableView.reloadData()
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        taskStore?.removeTask(withIndex: sender.tag)
        tasksTableView.reloadData()
    }
    
    @IBAction func textEdited(_ sender: UITextField) {
        taskStore?.editTask(withIndex: sender.tag, withText: sender.text ?? "New Task")
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        return taskStore?.tasksCount() ?? 0
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        
        cell.taskTextField.text = taskStore?.taskText(withIndex: indexPath.row)
//        cell.taskTextField.text = "\(indexPath.row)"
        cell.deleteButton.tag = indexPath.row
        cell.taskTextField.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row == taskStore?.tasksCount() ?? 1 - 1 else { return }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y //не могу понять, что крашит подгрузку, вызов fetchData непрекращается
        if currentOffset > tasksTableView.contentSize.height - 100 - scrollView.frame.size.height{
            guard !RealmPersistence.shared.isPaginating else {
                return
            }

            RealmPersistence.shared.fetchData(pagination: true){ [self] result in
                switch result{
                case .success(let moreData):
                    data.append(contentsOf: moreData)
                    DispatchQueue.main.async {
                        tasksTableView.reloadData()
                    }
                case .failure(_): break
                }
            }
            print("fetch more")
        }
        else{
            RealmPersistence.shared.fetchData(pagination: false, completion: {_ in })
        }
    }

    
}
