//
//  ClockView.swift
//  CustomUI
//
//  Created by Ruslan Murin on 16.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {
    var isSetuped = false
    
    @IBInspectable public var hourLineHeight: CGFloat = 40
    @IBInspectable var minuteLineHeight: CGFloat = 86
    @IBInspectable var secondLineHeight: CGFloat = 100
    @IBInspectable var hourLineColor: UIColor = .yellow{
        didSet { hourLine.backgroundColor = hourLineColor}
    }
    @IBInspectable var minuteLineColor: UIColor = .darkGray{
        didSet{ minuteLine.backgroundColor = minuteLineColor}
    }
    @IBInspectable var secondLineColor: UIColor = .black{
        didSet { secondLine.backgroundColor = secondLineColor}
    }
    @IBInspectable var hourTime: CGFloat = 0
    @IBInspectable var minuteTime: CGFloat = 0
    @IBInspectable var secondTime : CGFloat = 0
    
    let hourLine = Marker(backgroundColor: .red)
    let minuteLine = Marker(backgroundColor: .blue)
    let secondLine = Marker(backgroundColor: .green)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        customizeView()
        let w = layer.frame.width
        let h = layer.frame.height
        
        hourLine.frame = CGRect(x: w / 2 - (hourLineHeight / 10), y: h / 2 - hourLineHeight / 2, width: hourLineHeight / 5, height: hourLineHeight)
        minuteLine.frame = CGRect(x: w / 2 - (minuteLineHeight / 28), y: h / 2 - minuteLineHeight / 2, width: minuteLineHeight / 14, height: minuteLineHeight)
        secondLine.frame = CGRect(x: w / 2 - (secondLineHeight / 50), y: h / 2 - secondLineHeight / 2, width: secondLineHeight / 25, height: secondLineHeight)
        
        for line in [secondLine, minuteLine, hourLine]{
            line.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            addSubview(line)
        }

        updateHours()
        updateMinutes()
        updateSeconds()
        
        if isSetuped { return }
        isSetuped = true
    }
    func updateHours(){
        let hourAngle = CGFloat.pi * 2 * ((hourTime + 6) / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: hourAngle)
    }
    func updateMinutes(){
        let minAngle = CGFloat.pi * 2 * ((minuteTime + 30) / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: minAngle)
    }
    func updateSeconds(){
        let secAngle = CGFloat.pi * 2 * ((secondTime + 30) / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: secAngle)
    }
    
    func customizeView(){
        self.backgroundColor = . systemGray
        layer.cornerRadius = layer.frame.width / 2
        setClock()
    }
    
    func setClock(){
        let hourMarkerWidth: CGFloat = layer.frame.width / 36
        let hourMarkerHeight: CGFloat = layer.frame.height / 8
        let minuteMarkerWidth: CGFloat = layer.frame.width / 72
        let minuteMarkerHeight: CGFloat = layer.frame.height / 16
        
        for number in 1...60 {
            let angle = CGFloat.pi * 2 * (CGFloat(number) / CGFloat(60))
            let marker = Marker(backgroundColor: .black)
            marker.frame = CGRect(
                x:(layer.frame.width / 2 - minuteMarkerWidth / 2) + (layer.frame.width / 2 - minuteMarkerHeight / 2) * sin(angle),
                y: (layer.frame.height / 2 - minuteMarkerHeight / 2) + (layer.frame.height / 2 - minuteMarkerHeight / 2) * cos(angle),
                width: minuteMarkerWidth, height: minuteMarkerHeight)
            marker.transform = CGAffineTransform(rotationAngle: -angle)
            addSubview(marker)
        }
        for number in 1...12 {
            let angle = CGFloat.pi * 2 * (CGFloat(number) / CGFloat(12))
            let marker = Marker(backgroundColor: .yellow)
            marker.frame =  CGRect(
                x:(layer.frame.width / 2 - hourMarkerWidth / 2) + (layer.frame.width / 2 - hourMarkerHeight / 2) * sin(angle),
                y: (layer.frame.height / 2 - hourMarkerHeight / 2) + (layer.frame.height / 2 - hourMarkerHeight / 2) * cos(angle),
                width: hourMarkerWidth, height: hourMarkerHeight)
            marker.transform = CGAffineTransform(rotationAngle: -angle)
            addSubview(marker)
        }
    }
    
    override func prepareForInterfaceBuilder() {
        secondLine.backgroundColor = secondLineColor
        minuteLine.backgroundColor = minuteLineColor
        hourLine.backgroundColor = hourLineColor
    }
}
