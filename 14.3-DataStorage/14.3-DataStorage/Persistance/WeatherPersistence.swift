import Foundation

class WeatherPersistence {
    static let shared = WeatherPersistence()
    
    func storeDayWeather(_ day: Weather){
        UserDefaults.standard.setValue(day.main.temp, forKey: "Persistence.CurrTempKey")
        UserDefaults.standard.setValue(day.weather[0].weatherDescription, forKey: "Persistence.CurrDescrKey")
        UserDefaults.standard.setValue(day.name, forKey: "Persistence.CityKey")
        UserDefaults.standard.setValue(day.main.tempMin, forKey: "Persistence.CurrMinTemp")
        UserDefaults.standard.setValue(day.main.tempMax, forKey: "Persistence.CurrMaxTemp")
        UserDefaults.standard.setValue(day.main.pressure, forKey: "Persistence.CurrPressure")
    }
    
    func storeWeekWeather(_ week: WeeklyWeather){
        var minTemp: [Double] = []
        var maxTemp: [Double] = []
        var descriptions: [String] = []
        
        for (_, data) in week.daily.enumerated() {
            minTemp.append(data.temp.min)
            maxTemp.append(data.temp.max)
            descriptions.append(data.weather[0].weatherDescription)
        }
        
        UserDefaults.standard.setValue(minTemp, forKey: "Persistence.WeeklyMinTempKey")
        UserDefaults.standard.setValue(maxTemp, forKey: "Persistence.WeeklyMaxTempKey")
        UserDefaults.standard.setValue(descriptions, forKey: "Persistence.WeeklyDescriptionsKey")
    }
    
}
