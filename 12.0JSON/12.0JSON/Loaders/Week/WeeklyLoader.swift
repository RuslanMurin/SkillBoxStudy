import Foundation

class WeeklyLoader{
    
    var week: WeeklyWeather?
    
    func loadWeekWeather(completion: @escaping (WeeklyWeather) -> Void){
        let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=55.761665&lon=37.606667&units=metric&lang=ru&exclude=current,minutely,hourly&appid=7d5713da03610a097f05678b121a5b25")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary{
                if let week = WeeklyWeather(data: jsonDict){
                    self.week = week
                    // print(week.minTemps, week.maxTemps, week.descriptions)
                }
                DispatchQueue.main.async {
                    if let week = self.week{
                        completion(week)
                    }
                }
            }
            
        }
        task.resume()
    }
}
