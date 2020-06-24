//
//  FIrstCustomView.swift
//  CustomUI
//
//  Created by Ruslan Murin on 15.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

//@IBDesignable
class FIrstCustomView: UIView {
    
    var isSetuped = false
    private let button = UIButton()
    
    @IBInspectable var roundingMultiplier: CGFloat = 1.0
    @IBInspectable var indentSize: CGFloat = 5
    @IBInspectable var buttonColor: UIColor = .red
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupButton(multiplier: roundingMultiplier, color: buttonColor, indent: indentSize)
        
        if isSetuped { return }
        isSetuped = true
        
    }
    
    func setupButton(multiplier: CGFloat, color: UIColor, indent: CGFloat){
        let buttonWidth = frame.width - indentSize * 2
        let buttonHeight = frame.height - indentSize * 2
        
        layer.cornerRadius = frame.height / (1 * multiplier) + indentSize
        button.layer.cornerRadius = frame.height / (1 * multiplier)
        button.backgroundColor = color
        button.frame = CGRect(x: indent, y: indent, width: buttonWidth, height: buttonHeight)
        button.setTitle("Test Button", for: .normal)
        addSubview(button)
    }
}
