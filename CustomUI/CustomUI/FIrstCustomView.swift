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
    
    @IBInspectable var roundingMultiplier: CGFloat = 2.3{
        didSet{layoutIfNeeded()}
    }
    @IBInspectable var indentSize: CGFloat = 5
    @IBInspectable var buttonColor: UIColor = .red{
        didSet{ button.backgroundColor = buttonColor }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonWidth = frame.width - indentSize * 2
        let buttonHeight = frame.height - indentSize * 2
        
        button.frame = CGRect(x: indentSize, y: indentSize, width: buttonWidth, height: buttonHeight)
        button.layer.cornerRadius = frame.height / roundingMultiplier
        layer.cornerRadius = frame.height /  roundingMultiplier + indentSize

    }
    
    func setupButton(){
        button.setTitle("Test Button", for: .normal)
        addSubview(button)
    }
    
    override func prepareForInterfaceBuilder() {
        roundingMultiplier = 2.3
        indentSize = 5
        button.backgroundColor = buttonColor
    }
}
