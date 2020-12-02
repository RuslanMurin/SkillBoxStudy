import Foundation

protocol TaskStore {
    
    func addTask()
    
    func removeTask(withIndex: Int)
    
    func editTask(withIndex: Int, withText: String)
    
    func taskText(withIndex: Int) -> String
    
    func tasksCount() -> Int
}
