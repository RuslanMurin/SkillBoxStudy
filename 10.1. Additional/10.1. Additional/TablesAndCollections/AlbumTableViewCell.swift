//
//  AlbumTableViewCell.swift
//  10.1. Additional
//
//  Created by Ruslan Murin on 23.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class ImagesContainer{
    
    static func images() -> [[UIImage?]]{
        return [
            (1...6).map { UIImage(named: "c\($0)") },
            (1...8).map { UIImage(named: "cat\($0)") },
            (1...8).map { UIImage(named: "m\($0)") },
            (1...6).map { UIImage(named: "n\($0)") }
        ]
    }
}

class AlbumTableViewCell: UITableViewCell {
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var sendedIndex = 0
    
}

extension AlbumTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImagesContainer.images()[sendedIndex].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        let image = ImagesContainer.images()[sendedIndex][indexPath.row]
        cell.contentImageView?.image = image
        return cell
    }
}
