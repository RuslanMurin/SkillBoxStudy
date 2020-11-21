import Foundation

struct RickAndMortyDataBase: Codable {
    let results: [Result]
}

struct Result: Codable {
    let name: String
    let status: Status
    let species: Species
    let gender: Gender
    let origin: Location
    let image: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Codable {
    let name: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
