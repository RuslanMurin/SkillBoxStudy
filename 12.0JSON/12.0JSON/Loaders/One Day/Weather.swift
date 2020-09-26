import Foundation

class Weather{
    
    let name: String
    let main: NSDictionary
    let weather: NSArray
    let feelsLike: Double
    let humidity: Int
    let pressure: Int
    let temp: Double
    let minTemp: Double
    let maxTemp: Double
    let dictWeather: NSDictionary
    let description: String
    
    init?(data: NSDictionary) {
        guard let name = data["name"] as? String,
            let main = data["main"] as? NSDictionary,
            let weather = data["weather"] as? NSArray,
            let feelsLike = main["feels_like"] as? Double,
            let humidity = main["humidity"] as? Int,
            let pressure = main["pressure"] as? Int,
            let temp = main["temp"] as? Double,
            let minTemp = main["temp_min"] as? Double,
            let maxTemp = main["temp_max"] as? Double,
            let dictWeather = weather[0] as? NSDictionary,
            let description = dictWeather["description"] as? String else{ return nil }
        
        self.name = name
        self.main = main
        self.weather = weather
        self.feelsLike = (feelsLike - 273.15).rounded()
        self.humidity = humidity
        self.pressure = pressure
        self.temp = (temp - 273.15).rounded()
        self.minTemp = (minTemp - 273.15).rounded()
        self.maxTemp = (maxTemp - 273.15).rounded()
        self.dictWeather = dictWeather
        self.description = description
    }
    
}


