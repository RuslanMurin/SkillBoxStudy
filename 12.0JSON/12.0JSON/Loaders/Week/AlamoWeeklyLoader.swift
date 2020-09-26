import Foundation
import Alamofire

class AlamoWeeklyLoader{
    var week: WeeklyWeather?
    
    func loadWeekWeather(completion: @escaping (WeeklyWeather) -> Void){
        
        Alamofire.request("https://api.openweathermap.org/data/2.5/onecall?lat=58.596649&lon=49.660069&units=metric&lang=ru&exclude=current,minutely,hourly&appid=7d5713da03610a097f05678b121a5b25").responseJSON { response in
            if let objects = response.result.value,
                let jsonDict = objects as? NSDictionary{
                if let week = WeeklyWeather(data: jsonDict){
                    self.week = week
                }
                DispatchQueue.main.async {
                    if let week = self.week{
                        completion(week)
                    }
                }
            }
        }
    }
}
