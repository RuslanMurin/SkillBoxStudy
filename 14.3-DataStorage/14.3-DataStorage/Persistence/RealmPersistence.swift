import Foundation
import RealmSwift

class Task: Object{
    @objc dynamic var text = ""
    @objc dynamic var key = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "key"
    }
}


class RealmPersistence: TaskStore{
    
    static let shared = RealmPersistence()
    
    private let realm = try? Realm()
    
    func findObject(_ key: String) -> Task?{
        return realm?.object(ofType: Task.self, forPrimaryKey: key)
    }
    
    func tasksCount() -> Int {
        return realm?.objects(Task.self).count ?? 0
    }
    
    func taskText(withKey: String) -> String {
        return findObject(withKey)?.text ?? ""
    }
    
    func addTask(){
        let task = Task()
        try? realm?.write{
            realm?.add(task, update: .modified)
        }
    }
    
    func removeTask(withKey: String){
        try? realm?.write{
            guard let object = findObject(withKey) else {return}
            realm?.delete(object)
        }
    }
    
    func editTask(withKey: String, withText: String){
        try! realm?.write{
            guard let object = findObject(withKey) else {return}
            object.text = withText
        }
    }
    
    func fetchAll() -> [Task] {
        return Array(try! Realm().objects(Task.self)) 
    }
    
}
