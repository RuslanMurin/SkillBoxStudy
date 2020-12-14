import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var rickData: RickAndMortyDataBase?
    var rickAPI = RamAPI()
    var tempData: [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rickAPI.fetchCharacters(completion: {data in
            self.rickData = data
            self.tempData = Array(data.results[0...2])
            self.mainCollectionView.reloadData()
        })
        
        print(rickData?.results.count ?? 3)
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempData?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! BaseCollectionViewCell
        
        cell.nameLabel.text = rickData?.results[indexPath.row].name
        cell.genderLabel.text = rickData?.results[indexPath.row].gender.rawValue
        cell.originLabel.text = rickData?.results[indexPath.row].origin.name
        cell.speciesLabel.text = rickData?.results[indexPath.row].species.rawValue
        cell.statusLabel.text = "[\(rickData?.results[indexPath.row].status.rawValue ?? "")]"
        
        cell.characterImageView.kf.indicatorType = .activity
        cell.characterImageView.kf.setImage(with: URL(string: rickData?.results[indexPath.row].image ?? ""))
        
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard tempData?.count ?? 1 < (rickData?.results.count ?? 1) else { return } // проверка на достижение предельного значения
        
        let currentOffset = scrollView.contentOffset.y
        if currentOffset > mainCollectionView.contentSize.height - scrollView.frame.size.height{ // область начала загрузки
            
            loadMore() //Подгружаем еще
        }
        mainCollectionView.reloadData()
    }
    
    func loadMore(){
        if let results = rickData?.results{
            DispatchQueue.main.async{ [self] in
                if results.count - (tempData?.count ?? 0) > 3{
                    tempData?.append(contentsOf: results[0...2])
                }
                else { tempData?.append(results[0])
                }
            }
        }
    }
}
