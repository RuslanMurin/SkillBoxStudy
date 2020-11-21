import UIKit

class MainTabBarController: UITabBarController {
    
    var userDefautsVC = UserDefaultsViewController.storyboardInstance()
    var realmVC = TasksViewController.storyboardInstance()
    var coreDataVC = TasksViewController.storyboardInstance()
    var weatherVC = WeatherViewController.storyboardInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realmVC.delegate = RealmPersistence()
        coreDataVC.delegate = CoreDataPersistence()
        
        weatherVC.title = "Weather"
        userDefautsVC.title = "UserDefaults"
        realmVC.title = "Realm"
        coreDataVC.title = "CoreData"
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        weatherVC.weatherService = AlamoWeatherService()
        
        let controllers = [userDefautsVC, realmVC, coreDataVC, weatherVC]
        self.viewControllers = controllers
        
    }
}
