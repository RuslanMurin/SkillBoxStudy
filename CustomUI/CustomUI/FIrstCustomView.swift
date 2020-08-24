//
//  FIrstCustomView.swift
//  CustomUI
//
//  Created by Ruslan Murin on 15.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

@IBDesignable
class FIrstCustomView: UIView {
    
    private let button = UIButton()
    
    @IBInspectable var roundingMultiplier: CGFloat = 1.0
    @IBInspectable var indentSize: CGFloat = 5
    @IBInspectable var buttonColor: UIColor = .red
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton(multiplier: roundingMultiplier, color: buttonColor, indent: indentSize)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton(multiplier: roundingMultiplier, color: buttonColor, indent: indentSize)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
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
    override func prepareForInterfaceBuilder() {
        roundingMultiplier = 2.3
        indentSize = 5
        button.backgroundColor = buttonColor
    }
}
