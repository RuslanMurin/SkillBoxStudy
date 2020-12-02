import Foundation
import CoreData

class CoreDataPersistence: Task, TaskStore {
    
    
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "_4_3_DataStorage")
        DispatchQueue.global(qos: .utility).async {
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
        }
        return container
    }()
    
    let fetchRequest: NSFetchRequest<CoreTask> = CoreTask.fetchRequest()
    
    func saveContext () {
        guard persistentContainer.viewContext.hasChanges else { return }
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    
    func addTask() {
        _ = CoreTask(context: persistentContainer.viewContext)
        saveContext()
    }
    
    func tasksCount() -> Int {
        return try! persistentContainer.viewContext.fetch(fetchRequest).count
    }
    
    func removeTask(withIndex: Int) {
        let objects = try! persistentContainer.viewContext.fetch(fetchRequest)
        persistentContainer.viewContext.delete(objects[withIndex])
        saveContext()
    }
    
    func editTask(withIndex: Int, withText: String) {
        let objects = try! persistentContainer.viewContext.fetch(fetchRequest)
        objects[withIndex].text = withText
        saveContext()
    }
    
    func taskText(withIndex: Int) -> String {
        let objects = try! persistentContainer.viewContext.fetch(fetchRequest)
        return objects[withIndex].text ?? "New Task"
    }
    
}
