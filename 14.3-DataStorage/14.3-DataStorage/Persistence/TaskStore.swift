import Foundation

protocol TaskStore {
    
    func addTask()
    
    func removeTask(withKey: String)
    
    func editTask(withKey: String, withText: String)
    
    func taskText(withKey: String) -> String
    
    func tasksCount() -> Int
    
    func fetchAll() -> [Task]
    
}
