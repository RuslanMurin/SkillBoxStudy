import Foundation
import RealmSwift

class Task: Object{
    @objc dynamic var text = ""
<<<<<<< Updated upstream
    @objc dynamic var taskID = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "taskID"
=======
    @objc dynamic var key = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "key"
>>>>>>> Stashed changes
    }
}


class RealmPersistence: TaskStore{
<<<<<<< Updated upstream
    static let shared = RealmPersistence()
    
    private let realm = try! Realm()
    
    func findObject(_ key: String) -> Task?{
        return realm.object(ofType: Task.self, forPrimaryKey: key)
    }
    
    func tasksCount() -> Int {
        return realm.objects(Task.self).count
=======
    
    static let shared = RealmPersistence()
    
    private let realm = try? Realm()
    
    func findObject(_ key: String) -> Task?{
        return realm?.object(ofType: Task.self, forPrimaryKey: key)
    }
    
    func tasksCount() -> Int {
        return realm?.objects(Task.self).count ?? 0
>>>>>>> Stashed changes
    }
    
    func taskText(withKey: String) -> String {
        return findObject(withKey)?.text ?? ""
    }
    
    func addTask(){
        let task = Task()
<<<<<<< Updated upstream
        try! realm.write{
            realm.add(task, update: .modified)
=======
        try? realm?.write{
            realm?.add(task, update: .modified)
>>>>>>> Stashed changes
        }
    }
    
    func removeTask(withKey: String){
<<<<<<< Updated upstream
        try! realm.write{
            guard let object = findObject(withKey) else {return}
            realm.delete(object)
=======
        try? realm?.write{
            guard let object = findObject(withKey) else {return}
            realm?.delete(object)
>>>>>>> Stashed changes
        }
    }
    
    func editTask(withKey: String, withText: String){
<<<<<<< Updated upstream
        try! realm.write{
=======
        try! realm?.write{
>>>>>>> Stashed changes
            guard let object = findObject(withKey) else {return}
            object.text = withText
        }
    }
    
<<<<<<< Updated upstream
=======
    func fetchAll() -> [Task] {
        return Array(try! Realm().objects(Task.self)) 
    }
    
>>>>>>> Stashed changes
}
