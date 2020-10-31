import UIKit

class MainTabBarController: UITabBarController {
    
    var urlViewController = WeatherViewController.storyboardInstance()
    var alamofireViewController = WeatherViewController.storyboardInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlViewController.title = "URL"
        alamofireViewController.title = "Alamofire"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        urlViewController.weatherService = URLSessionWeatherService()
        alamofireViewController.weatherService = AlamofireWeatherService()
        
        let controllers = [urlViewController, alamofireViewController]
        self.viewControllers = controllers
    }
}
