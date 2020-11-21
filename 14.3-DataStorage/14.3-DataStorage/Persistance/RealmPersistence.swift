import Foundation
import RealmSwift

class Task: Object{
    @objc dynamic var text = ""
}

class RealmPersistence: Persistence{
    
    static let shared = RealmPersistence()
    
    private let realm = try! Realm()
    
    func tasksCount() -> Int {
        return realm.objects(Task.self).count
    }
    
    func taskText(withIndex: Int) -> String {
        var text = ""
        for (index, task) in realm.objects(Task.self).enumerated(){
            if index == withIndex{
                text = task.text
            }
        }
        return text
    }
    
    func addTask(){
        let task = Task()
        try! realm.write{
            realm.add(task)
        }
    }
    
    func removeTask(withIndex: Int){
        try! realm.write{
            for (index, task) in realm.objects(Task.self).enumerated(){
                if index == withIndex{
                    realm.delete(task)
                }
            }
        }
    }
    
    func editTask(withIndex: Int, withText: String){
        try! realm.write{
            for (index, task) in realm.objects(Task.self).enumerated(){
                if index == withIndex{
                    task.text = withText
                }
            }
        }
    }
    
}
