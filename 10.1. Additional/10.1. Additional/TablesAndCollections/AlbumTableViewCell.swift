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
        var catsImgs: [Images] = []
        var mealImgs: [Images] = []
        var natureImgs: [Images] = []
        for img in 1...8{
            catsImgs.append(Images(image: UIImage(named: "cat\(img)")))
        }
        for img in 1...8{
            mealImgs.append(Images(image: UIImage(named: "m\(img)")))
        }
        for img in 1...6{
            natureImgs.append(Images(image: UIImage(named: "n\(img)")))
        }
        return [
            [Images(image: UIImage(named: "c1")), Images(image: UIImage(named: "c2")), Images(image: UIImage(named: "c3")), Images(image: UIImage(named: "c4")), Images(image: UIImage(named: "c5")), Images(image: UIImage(named: "c6"))],
            catsImgs, mealImgs, natureImgs
        ]
    }
}

class AlbumTableViewCell: UITableViewCell {
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
    }
    let images = ImagesContainer.images()
}
extension AlbumTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return images.count
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

