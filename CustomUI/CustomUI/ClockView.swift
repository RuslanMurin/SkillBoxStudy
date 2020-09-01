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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setClock()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setClock()
    }
    
    @IBInspectable public var hourLineHeight: CGFloat = 40
    @IBInspectable var minuteLineHeight: CGFloat = 86
    @IBInspectable var secondLineHeight: CGFloat = 100
    @IBInspectable var hourLineColor: UIColor = .yellow{
        didSet { hourLine.backgroundColor = hourLineColor}
    }
    @IBInspectable var minuteLineColor: UIColor = .yellow{
        didSet{ minuteLine.backgroundColor = minuteLineColor}
    }
    @IBInspectable var secondLineColor: UIColor = .yellow{
        didSet { secondLine.backgroundColor = secondLineColor}
    }
    @IBInspectable var hourTime: CGFloat = 0
    @IBInspectable var minuteTime: CGFloat = 0
    @IBInspectable var secondTime : CGFloat = 0
    
    var hourLine = Marker()
    var minuteLine = Marker()
    var secondLine = Marker()
    var secondMarkers: [Marker] = []
    var hourMarkers: [Marker] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = layer.frame.width / 2
        
        let minuteMarkerWidth: CGFloat = layer.frame.width / 72
        let minuteMarkerHeight: CGFloat = layer.frame.height / 16
        let hourMarkerWidth: CGFloat = layer.frame.width / 36
        let hourMarkerHeight: CGFloat = layer.frame.height / 8
        
        let w = layer.frame.width
        let h = layer.frame.height
        
        for number in 0..<secondMarkers.count{
            let angle = CGFloat.pi * 2 * (CGFloat(number) / CGFloat(60))
            secondMarkers[number].frame = CGRect(
                x:(w / 2 - minuteMarkerWidth / 2) + (w / 2 - minuteMarkerHeight / 2) * sin(angle),
                y: (h / 2 - minuteMarkerHeight / 2) + (h / 2 - minuteMarkerHeight / 2) * cos(angle),
                width: minuteMarkerWidth, height: minuteMarkerHeight)
            secondMarkers[number].transform = CGAffineTransform(rotationAngle: -angle)
        }
        for number in 0..<hourMarkers.count{
            let angle = CGFloat.pi * 2 * (CGFloat(number) / CGFloat(12))
            hourMarkers[number].frame =  CGRect(
                x:(w / 2 - hourMarkerWidth / 2) + (w / 2 - hourMarkerHeight / 2) * sin(angle),
                y: (h / 2 - hourMarkerHeight / 2) + (h / 2 - hourMarkerHeight / 2) * cos(angle),
                width: hourMarkerWidth, height: hourMarkerHeight)
            hourMarkers[number].transform = CGAffineTransform(rotationAngle: -angle)
        }
        
        for line in [secondLine, minuteLine, hourLine]{
            line.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        }
        
        hourLine.frame = CGRect(x: w / 2 - (hourLineHeight / 10), y: h / 2 - hourLineHeight, width: hourLineHeight / 5, height: hourLineHeight)
        minuteLine.frame = CGRect(x: w / 2 - (minuteLineHeight / 28), y: h / 2 - minuteLineHeight, width: minuteLineHeight / 14, height: minuteLineHeight)
        secondLine.frame = CGRect(x: w / 2 - (secondLineHeight / 50), y: h / 2 - secondLineHeight, width: secondLineHeight / 25, height: secondLineHeight)
        
        updateTime()
    }
    
    func setClock(){
        for _ in 1...60 {
            let marker = Marker(backgroundColor: .yellow)
            secondMarkers.append(marker)
            addSubview(marker)
        }
        for _ in 1...12 {
            let marker = Marker(backgroundColor: .black)
            hourMarkers.append(marker)
            addSubview(marker)
        }
        for line in [secondLine, minuteLine, hourLine]{
            line.translatesAutoresizingMaskIntoConstraints = false
            addSubview(line)
        }
    }
    
    func updateHours(){
        let hourAngle = CGFloat.pi * 2 * (hourTime) / CGFloat(12)
        hourLine.transform = CGAffineTransform(rotationAngle: hourAngle)
    }
    func updateMinutes(){
        let minAngle = CGFloat.pi * 2 * (minuteTime) / CGFloat(60)
        minuteLine.transform = CGAffineTransform(rotationAngle: minAngle)
    }
    func updateSeconds(){
        let secAngle = CGFloat.pi * 2 * (secondTime) / CGFloat(60)
        secondLine.transform = CGAffineTransform(rotationAngle: secAngle)
    }
    
    func updateTime(){
        updateHours()
        updateMinutes()
        updateSeconds()
    }
    
    override func prepareForInterfaceBuilder() {
        secondLine.backgroundColor = secondLineColor
        minuteLine.backgroundColor = minuteLineColor
        hourLine.backgroundColor = hourLineColor
    }
}
