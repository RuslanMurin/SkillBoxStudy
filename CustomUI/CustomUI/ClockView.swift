//
//  ClockView.swift
//  CustomUI
//
//  Created by Ruslan Murin on 16.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

//@IBDesignable
class ClockView: UIView {
    var isSetuped = false
    
    @IBInspectable var hourLineHeight: CGFloat = 40
    @IBInspectable var minuteLineHeight: CGFloat = 86
    @IBInspectable var secondLineHeight: CGFloat = 100
    @IBInspectable var hourLineColor: UIColor = .red
    @IBInspectable var minuteLineColor: UIColor = .blue
    @IBInspectable var secondLineColor: UIColor = .green
    
    private let topMarker = UIView()
    private let righrMarker = UIView()
    private let bottomMarker = UIView()
    private let leftMarker = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.frame.width / 2
        
        let w = layer.frame.width
        let h = layer.frame.height
        let markerWidth: CGFloat = layer.frame.width / 36
        let markerHeight: CGFloat = layer.frame.height / 8
        
        
        topMarker.frame = CGRect(x: w / 2 - markerWidth / 2, y: 0, width: markerWidth, height: markerHeight)
        righrMarker.frame = CGRect(x: w - markerHeight, y: h / 2 - markerWidth / 2, width: markerHeight, height: markerWidth)
        bottomMarker.frame = CGRect(x: w / 2 - markerWidth / 2, y: h - markerHeight, width: markerWidth, height: markerHeight)
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerWidth / 2, width: markerHeight, height: markerWidth)
        
        for marker in [topMarker, righrMarker, bottomMarker, leftMarker]{
            marker.backgroundColor = .black
            addSubview(marker)
        }
        setLines()
        if isSetuped { return }
        isSetuped = true
    }
    
    func setLines(){
        let w = layer.frame.width
        let h = layer.frame.height
        
        let hourLine = UIView()
        let minuteLine = UIView()
        let secondLine = UIView()
        
        hourLine.backgroundColor = hourLineColor
        minuteLine.backgroundColor = minuteLineColor
        secondLine.backgroundColor = secondLineColor
        
        
        hourLine.frame = CGRect(x: w / 2 - (hourLineHeight / 10), y: h / 2 - (hourLineHeight / 10), width: hourLineHeight / 5, height: hourLineHeight)
        minuteLine.frame = CGRect(x: w / 2 - (minuteLineHeight / 24), y: h / 2 - (minuteLineHeight / 24), width: minuteLineHeight / 14, height: minuteLineHeight)
        secondLine.frame = CGRect(x: w / 2 - (secondLineHeight / 50), y: h / 2 - (secondLineHeight / 50), width: secondLineHeight / 25, height: secondLineHeight)
        
        for line in [secondLine, minuteLine, hourLine]{
            line.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            addSubview(line)
        }
        
    }
    
    
    
    
    
    
    func setClock(){
        
        for number in 1...12 {
            let angle = CGFloat.pi * 2 * (CGFloat(number) / CGFloat(6))
            let marker1 = UIView()
            let marker2 = UIView()
            
            marker1.transform = CGAffineTransform(rotationAngle: angle)
            marker2.transform = CGAffineTransform(rotationAngle: angle)
            marker1.backgroundColor = .red
            marker2.backgroundColor = .black
            addSubview(marker1)
            addSubview(marker2)
            print(angle)
        }
        
    }
}
