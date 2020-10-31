import Foundation

protocol WeatherService{
    
    func weekLoad(completion: @escaping (WeeklyWeather) -> Void)
    
    func dayLoad(completion: @escaping (Weather) -> Void)
}
