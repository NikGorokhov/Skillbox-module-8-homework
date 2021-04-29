

import UIKit

@IBDesignable
class ClockView: UIView {
    
    var isSetuped = false
    
    var markerSize: CGFloat = 3
    var markerLength: CGFloat = 12
    var markerColor = UIColor.blue
    
    @IBInspectable var hourLineSize: CGFloat = 6{
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var hourLineOffset: CGFloat = 60{
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var hourLineColor: UIColor = UIColor.red{
        didSet { hourLine.backgroundColor = hourLineColor }
    }
    
    
    @IBInspectable var minuteLineSize: CGFloat = 3.5{
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var minuteLineOffset: CGFloat = 30{
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var minuteLineColor: UIColor = UIColor.yellow{
        didSet { minuteLine.backgroundColor = minuteLineColor }
    }
    
    
    @IBInspectable var secondLineSize: CGFloat = 1.5{
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var secondLineOffset: CGFloat = 15{
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var secondLineColor: UIColor = UIColor.black{
        didSet { secondLine.backgroundColor = secondLineColor }
    }
    
    
    var roundedViewColor = UIColor.green
    
    @IBInspectable var hours: CGFloat = 2{
        didSet { layoutIfNeeded() }
    }
    
    @IBInspectable var minutes: CGFloat = 36{
        didSet { layoutIfNeeded() }
    }
    
    @IBInspectable var seconds: CGFloat = 47{
        didSet { layoutIfNeeded() }
    }
    
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    private let hourLine = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()
    
    private let roundedView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isSetuped { return }
        isSetuped = true
        
//        Определяем точку привязки у часовой, минутной и секундной стрелок
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        let w = frame.size.width
        let h = frame.size.height
        
//        Расположение часовой, минутной и секундной стрелок и центрального круга(не знаю как называется эта точка по центру часов)
//        и их цветов
        hourLine.frame = CGRect(x: w/2 - hourLineSize/2, y: hourLineOffset, width: hourLineSize, height: h/2 - hourLineOffset)
        hourLine.backgroundColor = hourLineColor
        
        minuteLine.frame = CGRect(x: w/2 - minuteLineSize/2, y: minuteLineOffset, width: minuteLineSize, height: h/2 - minuteLineOffset)
        minuteLine.backgroundColor = minuteLineColor
        
        secondLine.frame = CGRect(x: w/2 - secondLineSize/2, y: secondLineOffset, width: secondLineSize, height: h/2 - secondLineOffset)
        secondLine.backgroundColor = secondLineColor
        
        roundedView.frame = CGRect(x: w/2 - 8, y: h/2 - 8, width: 16, height: 16)
        roundedView.backgroundColor = roundedViewColor
        roundedView.layer.cornerRadius = 8
        
//        Вызов функций обновлениий часовой, минутной и секундной стрелок
        updateHours()
        updateMinutes()
        updateSeconds()
        
//        Расположение маркеров
        topMarker.frame = CGRect(x: w/2 - markerSize/2, y: 0, width: markerSize, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: h/2 - markerSize, width: markerLength, height: markerSize)
        rightMarker.frame = CGRect(x: w - markerLength, y: h/2 - markerSize, width: markerLength, height: markerSize)
        bottomMarker.frame = CGRect(x: w/2 - markerSize/2, y: h - markerLength, width: markerSize, height: markerLength)
        
        for v in [topMarker, leftMarker, rightMarker, bottomMarker]{
            v.backgroundColor = markerColor
        }
        
        layer.cornerRadius = frame.size.width/2
        
        for v in [topMarker, leftMarker, rightMarker, bottomMarker, hourLine, minuteLine, secondLine, roundedView]{
            addSubview(v)
        }
        
    }
    
//    Функции обновлениий часовой, минутной и секундной стрелок
    func updateHours(){
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    func updateMinutes(){
        let angle = CGFloat.pi * 2 * (minutes / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    func updateSeconds(){
        let angle = CGFloat.pi * 2 * (seconds / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: angle)
    }
}
