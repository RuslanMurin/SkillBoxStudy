import Foundation
import Alamofire

class AlamoWeatherLoader{
    
    var weather: Weather?
    
    func loadWeather(completion: @escaping (Weather) -> Void){
        Alamofire.request("https://api.openweathermap.org/data/2.5/weather?id=548408&lang=ru&appid=521b5222c10c1e6155e1d156115bb418").responseJSON { response in
            if let objects = response.result.value,
                let jsonDict = objects as? NSDictionary{
                
                if let loadedWeather = Weather(data: jsonDict){
                    self.weather = loadedWeather
                }
                DispatchQueue.main.async {
                    if let weather = self.weather{
                        completion(weather)
                    }
                }
            }
            
        }
    }
    
}
