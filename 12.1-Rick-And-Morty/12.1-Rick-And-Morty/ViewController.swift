import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var rickData: RickAndMortyDataBase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://rickandmortyapi.com/api/character").responseJSON{response in
            if let data = response.data{
                let loadedData = try? JSONDecoder().decode(RickAndMortyDataBase.self, from: data as Data)
                self.rickData = loadedData
                self.mainCollectionView.reloadData()
            }
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rickData?.results.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! BaseCollectionViewCell
        
        cell.nameLabel.text = rickData?.results[indexPath.row].name
        cell.genderLabel.text = rickData?.results[indexPath.row].gender.rawValue
        cell.originLabel.text = rickData?.results[indexPath.row].origin.name
        cell.speciesLabel.text = rickData?.results[indexPath.row].species.rawValue
        cell.statusLabel.text = "[\(rickData?.results[indexPath.row].status.rawValue ?? "")]"
        
        if let url = URL(string: rickData?.results[indexPath.row].image ?? "") {
            do {
                let data: Data = try Data(contentsOf: url)
                cell.characterImageView.image = UIImage(data: data)
            } catch {
                print("Error")
            }
        }
        
        return cell
    }
    
    
}
