import UIKit

class MainTabBarController: UITabBarController {
    
    var userDefautsVC = UserDefaultsViewController.storyboardInstance()
    var realmVC = TasksViewController.storyboardInstance()
    var coreDataVC = TasksViewController.storyboardInstance()
    var weatherVC = WeatherViewController.storyboardInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherVC.weatherService = AlamoWeatherService()
        realmVC.taskStore = RealmPersistence()
        coreDataVC.taskStore = CoreDataPersistence()
        coreDataVC.isCoredata = true
        
        let controllers = [userDefautsVC, realmVC, coreDataVC, weatherVC]
        self.viewControllers = controllers

        weatherVC.title = "Weather"
        userDefautsVC.title = "UserDefaults"
        realmVC.title = "Realm"
        coreDataVC.title = "CoreData"
        
    }
    
}
