import Foundation

protocol Persistence {
    
    func addTask()
    
    func removeTask(withIndex: Int)
    
    func editTask(withIndex: Int, withText: String)
    
    func taskText(withIndex: Int) -> String
    
    func tasksCount() -> Int
}
