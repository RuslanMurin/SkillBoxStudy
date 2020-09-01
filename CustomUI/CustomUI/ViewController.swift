//
//  ViewController.swift
//  CustomUI
//
//  Created by Ruslan Murin on 13.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let clock = ClockView()
        clock.frame = CGRect(x: view.frame.width / 2, y: view.frame.height - 250, width: 200, height: 200)
        view.addSubview(clock)
        let customSegmentedControl = CustomSegmentControl.loadFromNIB()
        customSegmentedControl.delegate = self
        view.addSubview(customSegmentedControl)
        customSegmentedControl.frame = CGRect(x: view.frame.width / 2 - 150, y: view.frame.height / 2, width: 120, height: 30)
        
    }
    
}

extension ViewController: CustomSegmentControlDelegate{
    func buttonPressed(_ customView: CustomSegmentControl) {
        if customView.firstButton.isSelected{
            print("\(customView.secondButtonTitle)nd Button Pressed")
        }
        else{ print("\(customView.firstButtonTitle)st Button Pressed") }
    }
    
}
