import Foundation

class UserDefaultsPersistence {
    static let shared = UserDefaultsPersistence()
    
    private let allNamesKey = "Persistance.allNamesKey"

    var allNames: [String]?{
        set { UserDefaults.standard.setValue(newValue, forKey: allNamesKey)}
        get { return UserDefaults.standard.stringArray(forKey: allNamesKey)}
    }
    
}
