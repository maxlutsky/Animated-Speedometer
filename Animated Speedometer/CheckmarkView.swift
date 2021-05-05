//
//  CheckmarkView.swift
//  Animated Speedometer
//
//  Created by Max on 05/05/2021.
//

import UIKit

class CheckmarkView: UIView {
    let circleLayer: CAShapeLayer!
    let checkmarkLayer: CAShapeLayer!

    override init(frame: CGRect) {
        checkmarkLayer = CAShapeLayer()
        circleLayer = CAShapeLayer()
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        let thikness: CGFloat = 11

        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-Double.pi) / 2, endAngle: CGFloat(Double.pi) * 2.5, clockwise: true)

        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = thikness
        circleLayer.strokeEnd = 0.0
        circleLayer.lineCap = CAShapeLayerLineCap.round
        
        let checkmarkPath = UIBezierPath()
        checkmarkPath.move(to: CGPoint(x: frame.size.width * 0.28, y: frame.size.height * 0.48))
        checkmarkPath.addLine(to: CGPoint(x: frame.size.width * 0.44, y: frame.size.height * 0.64))
        checkmarkPath.addLine(to: CGPoint(x: frame.size.width * 0.73, y: frame.size.height * 0.36))

        checkmarkLayer.frame = frame
        checkmarkLayer.path = checkmarkPath.cgPath
        checkmarkLayer.strokeColor = UIColor.red.cgColor
        checkmarkLayer.fillColor = nil
        checkmarkLayer.lineWidth = thikness
        checkmarkLayer.lineJoin = CAShapeLayerLineJoin.round
        checkmarkLayer.lineCap = CAShapeLayerLineCap.round
        checkmarkLayer.strokeEnd = 0
        

        layer.addSublayer(circleLayer)
        layer.addSublayer(checkmarkLayer)
    }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    func animateCircle(duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")

        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)

        circleLayer.strokeEnd = 1.0
        checkmarkLayer.strokeEnd = 1.0

        circleLayer.add(animation, forKey: "animateCircle")
        checkmarkLayer.add(animation, forKey: "strokeEnd")
    }
}
