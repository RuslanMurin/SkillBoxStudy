import Foundation

class URLSessionWeatherService: WeatherService{
    
    var weather: Weather?
    var week: WeeklyWeather?
    
    
    func weekLoad(completion: @escaping (WeeklyWeather) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=55.761665&lon=37.606667&units=metric&lang=ru&exclude=current,minutely,hourly&appid=7d5713da03610a097f05678b121a5b25")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                let loadedWeek = try? JSONDecoder().decode(WeeklyWeather.self, from: data as Data){
                self.week = loadedWeek
                DispatchQueue.main.async {
                    if let week = self.week{
                        completion(week)
                    }
                }
            }
            
        }
        task.resume()
    }
    
    func dayLoad(completion: @escaping (Weather) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=524894&lang=ru&appid=521b5222c10c1e6155e1d156115bb418")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                let loadedWeather = try? JSONDecoder().decode(Weather.self, from: data as Data){
                self.weather = loadedWeather
                DispatchQueue.main.async {
                    if let weather = self.weather{
                        completion(weather)
                    }
                }
            }
        }
        task.resume()
    }
    
}

