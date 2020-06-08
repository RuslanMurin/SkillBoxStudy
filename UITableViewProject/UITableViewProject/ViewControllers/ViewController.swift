//
//  ViewController.swift
//  UITableViewProject
//
//  Created by Ruslan Murin on 02.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let images: [UIImage?] = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6")]
    let names: [String] = ["Lake","Iced Lake","Fjord","Copper Mountain","Big Mountain","Forest"]
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 2
        let height = UIScreen.main.bounds.height / 3 - 50
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! MainCollectionViewCell
        cell.photosImageView.image = images[indexPath.row]
        cell.nameLabel.text = names[indexPath.row]
        return cell
    }
    

    
}
