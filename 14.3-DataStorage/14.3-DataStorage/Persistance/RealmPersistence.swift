import Foundation
import RealmSwift

class Task: Object{
    @objc dynamic var text = ""
    @objc dynamic var taskID = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "taskID"
    }
}
    

class RealmPersistence: TaskStore{
    static let shared = RealmPersistence()
    private let realm = try! Realm()
    
    var isPaginating = false
    var countClicker = 0
    
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[Task], Error> ) -> Void){
        if pagination{
            isPaginating = true
        }
        DispatchQueue.main.async(){ [self] in
            let data = Array(realm.objects(Task.self))
            var tempData = Array(data)
            
            completion(.success(pagination
            ? tempData
            : tempData
            ))
            if pagination{
                countClicker += 15 //на этом этапе хотелось бы выполнить проверку на необходимость продолжать загрузку, но все крашится.
                if data.count - countClicker - 15 < 15{
                    tempData = Array(data[0...1])
                }
                else{
                    isPaginating = false
                }
            }
        }
    }
    
    func tasksCount() -> Int {
        return realm.objects(Task.self).count
    }
    
    func taskText(withIndex: Int) -> String {
        guard realm.objects(Task.self)[withIndex].text != "" else { return "New Task" }
        return Array(realm.objects(Task.self).enumerated())[withIndex].element.text
    }
    
    func addTask(){
        let task = Task()
        try! realm.write{
            realm.add(task)
        }
    }
    
    func removeTask(withIndex: Int){
        try! realm.write{
            realm.delete(realm.objects(Task.self)[withIndex])
        }
    }
    
    func editTask(withIndex: Int, withText: String){
        try! realm.write{
            realm.objects(Task.self)[withIndex].text = withText
        }
    }
    
}
