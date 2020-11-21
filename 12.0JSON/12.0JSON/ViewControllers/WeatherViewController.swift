import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var mainDescriptionLabel: UILabel!
    @IBOutlet weak var mainTableView: UITableView!
    
    var weather: Weather?
    var week: WeeklyWeather?
    
    var weatherService: WeatherService?
    
    static func storyboardInstance() -> WeatherViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "Parent") as? WeatherViewController ?? WeatherViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        weatherService?.dayLoad(completion: { weather in self.weather = weather
            self.cityLabel.text = weather.name
            self.tempLabel.text = "\(Int(weather.main.temp - 273.0)) C"
            self.descriptionLabel.text = weather.weather[0].weatherDescription
            self.mainDescriptionLabel.text = "Сейчас \(weather.weather[0].weatherDescription). Максимальная температура воздуха: \(Int(weather.main.tempMax - 273.0)) C. Минимальная температура воздуха: \(Int(weather.main.tempMin - 273.0)) C. Атмосферное давление: \(weather.main.pressure)мм.рт.ст. Влажность: \(weather.main.humidity)%."
            
            self.weatherService?.weekLoad(completion: { week in self.week = week
                self.mainTableView.reloadData()
            })
        })
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //        print("in tableView \(week?.descriptions.count ?? 0)")
        return week?.daily.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeeklyTableViewCell
        
        cell.descriptionLabel.text = week?.daily[indexPath.row].weather[0].weatherDescription
        cell.maxTempLabel.text = "\(Int(week?.daily[indexPath.row].temp.max ?? 0))"
        cell.minTempLabel.text = "\(Int(week?.daily[indexPath.row].temp.min ?? 0))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
