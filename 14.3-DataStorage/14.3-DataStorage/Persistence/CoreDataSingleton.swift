import Foundation
import CoreData

class CoreDataSingleton{
    static let shared = CoreDataSingleton()
    
    private init(){}
    
    private(set) var persistentContainer: NSPersistentContainer?
    
    func initialize(completion: @escaping () -> (Void)){

             let container = NSPersistentContainer(name: "_4_3_DataStorage")
             DispatchQueue.global(qos: .background).async {
                 container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                     if let error = error as NSError? {
                         fatalError("Unresolved error \(error), \(error.userInfo)")
                     }
                     container.viewContext.automaticallyMergesChangesFromParent = true
                    
                    self.persistentContainer = container
                    
                    completion()
                 })
             }
    }
    
    func saveContext () {
        guard ((persistentContainer?.viewContext.hasChanges) != nil) else { return }
        do {
            try persistentContainer?.viewContext.save()
        } catch {
            persistentContainer?.viewContext.rollback()
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
