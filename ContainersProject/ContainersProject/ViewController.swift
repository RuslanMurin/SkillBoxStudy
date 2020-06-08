//
//  ViewController.swift
//  ContainersProject
//
//  Created by Ruslan Murin on 26.05.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

final private class DefaultPlaceholderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }

  // Настроить цвет по умолчанию.
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureButtonStackView()
        configureVCsStack()
        showChildVC(placeholderVC)
    }
    var buttonsStackView = UIStackView()
    var childVCStackView = UIStackView()
    
    private var placeholderVC: UIViewController = DefaultPlaceholderViewController()
    private var childs: [UIViewController] = []
    private var defaultVC = DefaultPlaceholderViewController()
    
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
        NSLayoutConstraint.activate([
                    buttonsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                    buttonsStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
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
        NSLayoutConstraint.activate([
                    childVCStackView.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor),
                    childVCStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    childVCStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                    childVCStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func addButton(with buttonTitle: String){
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle(buttonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonsStackView.addArrangedSubview(button)
        button.tag = buttonsStackView.arrangedSubviews.count
        button.addTarget(self, action: #selector(showHideContentVC(_:)), for: .touchUpInside)
        
    }
    

     
    func addVC(_ vc: UIViewController, buttonTitle: String, backgroundColor: UIColor) {
        assert(childs.count < 6, "Too many child ViewControllers: only 6 allowed")
        childs.append(vc)
        vc.view.backgroundColor = backgroundColor
        if let tag = Int(buttonTitle){
        print(tag)
        vc.view.tag = tag + 10
        print(vc.view.tag)
        vc.title = "\(buttonTitle)vc"
        addButton(with: buttonTitle)
        }
         // Сохраняем контроллер, создаем кнопку, показываем кнопку.
     }
     
     func setPlaceholder(_ vc: UIViewController) {
        self.placeholderVC = vc
     }
     
    @objc func showHideContentVC(_ sender: UIButton) {
        sender.isSelected.toggle()
        let index = buttonsStackView.arrangedSubviews.firstIndex(of: sender) ?? 0
        let vc = childs[index] // Небезопасный способ. Подумайте, как можно по-другому.
        if sender.isSelected {
          // показываем
          showChildVC(vc)
        } else {
          // скрываем
          hideChildVC(vc)
        }
        
        if children.isEmpty {
            showChildVC(placeholderVC)
        }
        else{
            hideChildVC(placeholderVC)
        }
         // Показываем или скрываем контент контроллер, который соответствует кнопке
         // Если все контент контроллеры скрыты, то показываем placeholder
     }

    private func showChildVC(_ childVC: UIViewController) {
        addChild(childVC)
        childVCStackView.addArrangedSubview(childVC.view)
//        childVCStackView.addSubview(childVC.view)
        childVC.didMove(toParent: self)
         // Функция для добавления контроллера в иерархию и его показа
     }
     
     private func hideChildVC(_ childVC: UIViewController) {
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
         // Функция для удаления контроллера из иерархии и его скрытия
     }
}

