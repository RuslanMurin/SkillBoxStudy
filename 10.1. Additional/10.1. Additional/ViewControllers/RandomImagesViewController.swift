//
//  RandomImagesViewController.swift
//  10.1. Additional
//
//  Created by Ruslan Murin on 24.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class RandomImagesViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    
    let mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.addSubview(mainStackView)
        mainStackView.frame = CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height)
        mainStackView.distribution = .fillEqually
        mainStackView.axis = .vertical
        mainStackView.spacing = 5
        for el in 1...6{
            let imageView = UIImageView()
            imageView.image = UIImage(named: "c\(el)")
            mainStackView.addArrangedSubview(imageView)
        }
        for el in 1...8{
            let imageView = UIImageView()
            imageView.image = UIImage(named: "cat\(el)")
            mainStackView.addArrangedSubview(imageView)
        }
        // Do any additional setup after loading the view.
    }
    
}
