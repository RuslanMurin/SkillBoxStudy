import Foundation
import Alamofire

class RamAPI{
    
    var dataBase: RickAndMortyDataBase?
    
    func fetchCharacters(completion: @escaping (RickAndMortyDataBase) -> Void){  Alamofire.request("https://rickandmortyapi.com/api/character").responseJSON{response in
        if let data = response.data{
            let fetchedData = try? JSONDecoder().decode(RickAndMortyDataBase.self, from: data as Data)
            self.dataBase = fetchedData
            DispatchQueue.main.async {
                if let data = self.dataBase{
                    completion(data)
                }
            }
        }
    }
    }
    
}
