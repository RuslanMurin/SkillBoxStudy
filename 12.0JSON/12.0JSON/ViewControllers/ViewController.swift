import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weekTableView: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainDescrLabel: UILabel!
    
    var weather: Weather?
    
    var week: WeeklyWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherLoader().loadWeather(completion: { weather in self.weather = weather
            self.tempLabel.text = "\(weather.temp) C"
            self.cityLabel.text = weather.name
            self.descriptionLabel.text = weather.description
            self.mainDescrLabel.text = "Сейчас \(weather.description). Максимальная температура воздуха: \(weather.maxTemp) C. Минимальная температура воздуха: \(weather.minTemp) C. Атмосферное давление: \(weather.pressure)мм.рт.ст. Влажность: \(weather.humidity)%."
        })
        WeeklyLoader().loadWeekWeather(completion: { week in
            self.week = week
            print("in VC \(week.descriptions.count)")
            self.weekTableView.reloadData()
            
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("in tableView \(week?.descriptions.count ?? 0)")
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
