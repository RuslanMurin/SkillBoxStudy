//
//  ViewController.swift
//  ContainersProject
//
//  Created by Ruslan Murin on 06.05.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    enum ChildsVCs{
static let firstChildVC = FirstChildVC()
static let secondChildVC = SecondChildVC()
static let thirdChildVC = ThirdChildVC()
    }
    
    func addChildVC(_ childVC: UIViewController){
        addChild(childVC)
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        setChildVCConstraints(childVC)
    }
    
     func removeChildVC(_ childVC: UIViewController){
        childVC.didMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
        
    }

    func setChildVCConstraints(_ childVC: UIViewController){
        
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        childVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        childVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        childVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        childVC.view.heightAnchor.constraint(equalToConstant: (self.view.frame.height - 110) / CGFloat(view.subviews.count - 1) ).isActive = true
            //написать высоту subView через view.subview.count
    }
    
    var firstSwitcher = false
    var secondSwitcher = false
    var thirdSwitcher = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func firstButtonPressed(){
        firstSwitcher = !firstSwitcher
        print(firstSwitcher)
        if firstSwitcher == true{
            addChildVC(ChildsVCs.firstChildVC)
            firstButton.tintColor = .systemBlue
        }
        else{
            removeChildVC(ChildsVCs.firstChildVC)
            firstButton.tintColor = .darkGray
        }
    }
    
    @IBAction func secondButtonPressed(){
        secondSwitcher = !secondSwitcher
        print(secondSwitcher)
        if secondSwitcher == true{
            addChildVC(ChildsVCs.secondChildVC)
            secondButton.tintColor = .systemBlue
        }
        else{
            removeChildVC(ChildsVCs.secondChildVC)
            secondButton.tintColor = .darkGray
        }
    }
    
    
}

