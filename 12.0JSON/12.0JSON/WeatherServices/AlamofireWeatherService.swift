import Foundation
import Alamofire

class AlamofireWeatherService: WeatherService{
    var weather: Weather?
    var week: WeeklyWeather?
    
    func weekLoad(completion: @escaping (WeeklyWeather) -> Void) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/onecall?lat=58.596649&lon=49.660069&units=metric&lang=ru&exclude=current,minutely,hourly&appid=7d5713da03610a097f05678b121a5b25").responseJSON { response in
            if let data = response.data{
                let loadedWeek = try? JSONDecoder().decode(WeeklyWeather.self, from: data as Data)
                    self.week = loadedWeek
                DispatchQueue.main.async {
                    if let week = self.week{
                        completion(week)
                    }
                }
            }
        }
    }
    
    func dayLoad(completion: @escaping (Weather) -> Void) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/weather?id=548408&lang=ru&appid=521b5222c10c1e6155e1d156115bb418").responseJSON { response in
            if let data = response.data{
                let loadedWeather = try? JSONDecoder().decode(Weather.self, from: data as Data)
                    self.weather = loadedWeather
                DispatchQueue.main.async {
                    if let weather = self.weather{
                        completion(weather)
                    }
                }
            }
        }
    }
}



