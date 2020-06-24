//
//  AlbumTableViewCell.swift
//  10.1. Additional
//
//  Created by Ruslan Murin on 23.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit
struct Images{
    var image: UIImage?
}

class ImagesContainer{
    static func images() -> [[Images]]{
        return [
            [Images(image: UIImage(named: "c1")), Images(image: UIImage(named: "c2")), Images(image: UIImage(named: "c3")), Images(image: UIImage(named: "c4")), Images(image: UIImage(named: "c5")), Images(image: UIImage(named: "c6"))]
        ]
    }
}

class AlbumTableViewCell: UITableViewCell {
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        flowLayout.itemSize = CGSize(width: 80.0, height: 80.0)
//        flowLayout.minimumInteritemSpacing = 1.0
//        imagesCollectionView.collectionViewLayout = flowLayout
//        imagesCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
           let images = ImagesContainer.images()
}
extension AlbumTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func setupDataSource(){
        self.imagesCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.section][indexPath.row]
        cell.contentImageView?.image = image.image
        return cell
    }
}

