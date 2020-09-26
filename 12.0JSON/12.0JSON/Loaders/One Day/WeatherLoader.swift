import Foundation

class WeatherLoader{
    
    var weather: Weather?
    
    func loadWeather(completion: @escaping (Weather) -> Void){

        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=524894&lang=ru&appid=521b5222c10c1e6155e1d156115bb418")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary{
//                                print(json)
                if let loadedWeather = Weather(data: jsonDict){
                    self.weather = loadedWeather
//                    print(self.weather.count)
                }
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
