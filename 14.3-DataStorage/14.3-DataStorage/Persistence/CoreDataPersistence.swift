import Foundation
import CoreData

class CoreDataPersistence:  Task, TaskStore{

    let container = CoreDataSingleton.shared.persistentContainer
    
    let fetchRequest: NSFetchRequest<CoreTask> = CoreTask.fetchRequest()
    
    func predicating(_ key: String)->NSFetchRequest<CoreTask>{
        let fr: NSFetchRequest<CoreTask> = CoreTask.fetchRequest()
        fr.predicate = NSPredicate(format: "key ==%@", key)
        return fr
    }
    
    func addTask() {
        let entity = CoreTask(context: CoreDataSingleton.shared.persistentContainer!.viewContext)
        entity.key = UUID().uuidString
        CoreDataSingleton.shared.saveContext()
    }
    
    func tasksCount() -> Int {
        return try! container?.viewContext.fetch(fetchRequest).count ?? 0
    }
    
    func removeTask(withKey: String) {
        guard let task = try! container?.viewContext.fetch(predicating(withKey))[0] else { return }
        do{
            container?.viewContext.delete(task)
            CoreDataSingleton.shared.saveContext()
            }
    }
    
    func editTask(withKey: String, withText: String) {
        guard let task = try! container?.viewContext.fetch(predicating(withKey))[0] else { return }
        task.text = withText
        CoreDataSingleton.shared.saveContext()
    }
    
    func taskText(withKey: String) -> String {
        guard let task = try! container?.viewContext.fetch(predicating(withKey))[0] else { return ""}
        return task.text ?? ""
    }
}
