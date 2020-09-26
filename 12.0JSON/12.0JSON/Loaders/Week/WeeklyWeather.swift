import Foundation

class WeeklyWeather{
    let daily: NSArray
    var descriptions: [String] = []
    var minTemps: [Double] = []
    var maxTemps: [Double] = []
    init?(data: NSDictionary) {
        guard
            let daily = data["daily"] as? NSArray
            else{ return nil }
        for day in 0...6{
            if let d = daily[day] as? NSDictionary{
                if let temp = d["temp"] as? NSDictionary{
                    if let minTemp = temp["min"] as? Double{
                        minTemps.append(minTemp.rounded())
                    }
                    if let maxTemp = temp["max"] as? Double{
                        maxTemps.append(maxTemp.rounded())
                    }
                }
                if let weather = d["weather"] as? NSArray{
                    if let description = weather[0] as? NSDictionary{
                        if let descr = description["description"] as? String{
                            descriptions.append(descr)
                        }
                    }
                }
            }
        }
        self.daily = daily
    }
    
}
