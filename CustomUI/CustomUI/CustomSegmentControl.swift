//
//  CustomScrollView.swift
//  CustomUI
//
//  Created by Ruslan Murin on 21.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

protocol CustomSegmentControlDelegate: NSObjectProtocol {
    func buttonPressed(_ customView: CustomSegmentControl)
}

@IBDesignable
class CustomSegmentControl: UIView {
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var substrateView: UIView!{
        didSet{ self.backgroundColor = substrateColor}
    }
    
    @IBInspectable var substrateColor: UIColor = .systemGray
    @IBInspectable var firstButtonTitle: String = "1"
    @IBInspectable var secondButtonTitle: String = "2"
    
    weak var delegate: CustomSegmentControlDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        substrateView.frame = CGRect(x: 5, y: 5, width: (layer.frame.width - 15) / 2, height: layer.frame.height - 10)
        firstButton.isSelected = true
        firstButton.setTitle(firstButtonTitle, for: .normal)
        secondButton.setTitle(secondButtonTitle, for: .normal)
    }
    
    func animate(_ sender: UIButton){
        if sender.isSelected != true{
            UIView.animate(withDuration: 0.5) {
                if self.firstButton.isSelected {
                    self.substrateView.center.x += self.firstButton.frame.width + CGFloat(5)
                }
                else{
                    self.substrateView.center.x -= self.firstButton.frame.width  + CGFloat(5)
                }
            }
        }
    }
    
    @IBAction func firstButtonPressed(_ sender: UIButton) {
        delegate?.buttonPressed(self)
        
        if sender.isSelected == false{
            self.animate(sender)
            self.secondButton.isSelected.toggle()
            self.firstButton.isSelected.toggle()
        }
    }
    
    @IBAction func secondButtonPressed(_ sender: UIButton) {
        delegate?.buttonPressed(self)
        
        if sender.isSelected == false{
            self.animate(sender)
            self.firstButton.isSelected.toggle()
            self.secondButton.isSelected.toggle()
        }
    }
    
    static func loadFromNIB() -> CustomSegmentControl{
        let nib = UINib(nibName: "CustomSegmentControl", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! CustomSegmentControl
    }
}
