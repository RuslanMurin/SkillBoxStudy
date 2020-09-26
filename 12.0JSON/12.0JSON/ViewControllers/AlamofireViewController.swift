import UIKit
import Alamofire

class AlamofireViewController: UIViewController {

    var weather: Weather?
    var week: WeeklyWeather?
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weekTableView: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainDescrLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AlamoWeatherLoader().loadWeather(completion: { weather in self.weather = weather
            self.cityLabel.text = weather.name
            self.tempLabel.text = "\(weather.temp) C"
            self.descriptionLabel.text = weather.description
            self.mainDescrLabel.text = "Сейчас \(weather.description). Максимальная температура воздуха: \(weather.maxTemp) C. Минимальная температура воздуха: \(weather.minTemp) C. Атмосферное давление: \(weather.pressure)мм.рт.ст. Влажность: \(weather.humidity)%."
        
            AlamoWeeklyLoader().loadWeekWeather(completion: { week in self.week = week
                self.weekTableView.reloadData()
            })
        })
    }
}

extension AlamofireViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return week?.descriptions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeekTableViewCell
        
        cell.descriptionLabel.text = week?.descriptions[indexPath.row]
        cell.maxTempLabel.text = "\(week?.maxTemps[indexPath.row] ?? 0.0)"
        cell.minTempLabel.text = "\(week?.minTemps[indexPath.row] ?? 0.0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
