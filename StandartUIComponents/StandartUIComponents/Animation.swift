//
//  Animation.swift
//  StandartUIComponents
//
//  Created by Ruslan Murin on 12.05.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

func createImagesArray(total: Int)->[UIImage]{
    var imageArray: [UIImage] = []
    for imageCount in 1...total{
        let imageName = "\(imageCount)"
        guard let image = UIImage(named: imageName) else { break }
        imageArray.append(image)
    }
    return imageArray
}
    


