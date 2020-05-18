//
//  ViewController.swift
//  ContainerViewProject
//
//  Created by Ruslan Murin on 07.05.2020.
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
        childVC.view.heightAnchor.constraint(equalTo: <#T##NSLayoutDimension#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>isActive = true

//        childVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        childVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        childVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
//
//        switch view.subviews.count {
//        case 1:
//            childVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110).isActive = true
//        case 2:
//            childVC.view.topAnchor.constraint(equalTo: view.centerYAnchor, constant: self.view.frame.height / 2).isActive = true
//        case 3:
//            childVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: self.view.frame.height / 3).isActive = true
//        default:
//            return
//        }
//        childVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110).isActive = true
        
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
        if firstSwitcher == true{
            addChildVC(ChildsVCs.firstChildVC)
            firstButton.tintColor = .systemBlue
            print(view.subviews.count)
        }
        else{
            removeChildVC(ChildsVCs.firstChildVC)
            firstButton.tintColor = .darkGray
            print(view.subviews.count)
        }
    }
    
    @IBAction func secondButtonPressed(){
        secondSwitcher = !secondSwitcher

        if secondSwitcher == true{
            addChildVC(ChildsVCs.secondChildVC)
            secondButton.tintColor = .systemBlue
                        print(view.subviews.count)
        }
        else{
            removeChildVC(ChildsVCs.secondChildVC)
            secondButton.tintColor = .darkGray
                        print(view.subviews.count)
        }
    }
    
    
}

