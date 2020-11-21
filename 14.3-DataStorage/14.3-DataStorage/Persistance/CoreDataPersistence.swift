import Foundation
import CoreData

class CoreDataPersistence: CoreTask, Persistence {

    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "_4_3_DataStorage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    let fetchRequest: NSFetchRequest<CoreTask> = CoreTask.fetchRequest()
    
    func saveContext () {
        if persistentContainer.viewContext.hasChanges {
              do {
                try persistentContainer.viewContext.save()
              } catch {
                persistentContainer.viewContext.rollback()
                  let nserror = error as NSError
                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
          }
      }
    
    func addTask() {
        let newTask = CoreTask(context: persistentContainer.viewContext)
        newTask.text = "New Task"
        saveContext()
    }
    
    func tasksCount() -> Int {
        let objects = try! persistentContainer.viewContext.fetch(fetchRequest)
        return objects.count
    }
    
    func removeTask(withIndex: Int) {
        let objects = try! persistentContainer.viewContext.fetch(fetchRequest)
        persistentContainer.viewContext.delete(objects[withIndex])
        saveContext()
    }
    
    func editTask(withIndex: Int, withText: String) {
        let objects = try! persistentContainer.viewContext.fetch(fetchRequest)
        
        for (index, task) in objects.enumerated(){
            if index == withIndex{
                task.text = withText
            }
        }
        saveContext()
    }
    
    func taskText(withIndex: Int) -> String {
        var text = ""
        let objects = try! persistentContainer.viewContext.fetch(fetchRequest)
        
        for (index, task) in objects.enumerated(){
            if index == withIndex{
                text = task.text ?? "New Task"
            }
        }
        return text
    }
}
