//
//  AlbumTableViewCell.swift
//  10.1. Additional
//
//  Created by Ruslan Murin on 23.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit
//Ячейка таблицы
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
    
    var images: [UIImage?] = []
    
}
//Коллекция
extension AlbumTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        cell.contentImageView?.image = images[indexPath.row]
        return cell
    }
}
