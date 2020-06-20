//
//  ViewController.swift
//  UITableViewProject
//
//  Created by Ruslan Murin on 02.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit
struct Images{
    var images: UIImage?
    var names: String
}
class ImagesContainer{
    static func namedImages() -> [Images]{
        return [Images(images: UIImage(named: "1"), names: "Lake"),
                Images(images: UIImage(named: "2"), names: "Iced Lake"),
                Images(images: UIImage(named: "3"), names: "Fjord"),
                Images(images: UIImage(named: "4"), names: "Copper Mountain"),
                Images(images: UIImage(named: "5"), names: "Big Mountain"),
                Images(images: UIImage(named: "6"), names: "Forest")
        ]
    }
}

class ViewController: UIViewController {
    let namedImages = ImagesContainer.namedImages()
}

extension ViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2 - 20
        let height = collectionView.bounds.height / 2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return namedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! MainCollectionViewCell
        cell.photosImageView.image = namedImages[indexPath.row].images
        cell.nameLabel.text = namedImages[indexPath.row].names
        return cell
    }
    

    
}
