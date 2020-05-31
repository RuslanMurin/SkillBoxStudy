//
//  ViewController.swift
//  ContainersProject
//
//  Created by Ruslan Murin on 26.05.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureButtonStackView()
        configureVCsStack()
    }
    var buttonsStackView = UIStackView()
    var childVCStackView = UIStackView()
    
    func configureButtonStackView(){
        view.addSubview(buttonsStackView)
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .fill
        buttonsStackView.spacing = 1
        setButtonStackView()
    }
    func setButtonStackView(){
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        buttonsStackView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
    }
    
    func configureVCsStack(){
        view.addSubview(childVCStackView)
        childVCStackView.axis = .vertical
        childVCStackView.distribution = .fillEqually
        childVCStackView.alignment = .fill
        childVCStackView.spacing = 1
        setVCsStack()
    }
    
    func setVCsStack(){
        childVCStackView.translatesAutoresizingMaskIntoConstraints = false
        childVCStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0).isActive = true
        childVCStackView.topAnchor.constraint(equalToSystemSpacingBelow: buttonsStackView.bottomAnchor, multiplier: 0).isActive = true
        childVCStackView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 0).isActive = true
        childVCStackView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 0).isActive = true
    }
    
    func setButton(with buttonTitle: String){
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle(buttonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonsStackView.addArrangedSubview(button)
        
        if let tag = Int(buttonTitle){
        button.tag = tag
        button.addTarget(self, action: #selector(showHideContentVC(_:)), for: .touchUpInside)
        }
    }
    
    private var childs: [UIViewController] = []
    private var defaultVC: UIViewController?
     
     func addVC(_ vc: UIViewController, buttonTitle: String) {
        assert(childs.count < 6, "Too many child ViewControllers: only 6 allowed")
        addChild(vc)
        vc.title = "\(buttonTitle)vc"
        setButton(with: buttonTitle)
         // Сохраняем контроллер, создаем кнопку, показываем кнопку.
     }
     
     func setPlaceholder(_ vc: UIViewController) {
        if childs.isEmpty{
        addChildVC(childVC: vc)
        childVCStackView.addArrangedSubview(vc.view)
        }
        else{vc.removeFromParent()}
         // Сохраняем контроллер, который показывается в случае, если ни один контент контроллер не показан
     }
     
    @objc func showHideContentVC(_ sender: UIButton) {
        
    
         // Показываем или скрываем контент контроллер, который соответствует кнопке
         // Если все контент контроллеры скрыты, то показываем placeholder
     }

     private func addChildVC(childVC: UIViewController) {
        childVCStackView.addArrangedSubview(childVC.view)
         // Функция для добавления контроллера в иерархию и его показа
     }
     
     private func removeChildVC(childVC: UIViewController) {
        childVC.removeFromParent()
         // Функция для удаления контроллера из иерархии и его скрытия
     }
}

