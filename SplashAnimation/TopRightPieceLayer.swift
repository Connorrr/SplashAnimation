//
//  ScreenPieceLayer.swift
//  SplashAnimation
//
//  Created by Connor Reid on 1/11/2016.
//  Copyright © 2016 Connor Reid. All rights reserved.
//

import UIKit

class TopRightPieceLayer: CAShapeLayer {
    
    var animationDuration = 0.0
    
    private var firstPoint = CGPointZero
    private var secondPoint = CGPointZero
    private var thirdPoint = CGPointZero
    private var fourthPoint = CGPointZero
    private var fifthPoint = CGPointZero
    private var sixthPoint = CGPointZero
    private var seventhPoint = CGPointZero
    private var eighthPoint = CGPointZero
    private var ninthPoint = CGPointZero
    
    private var splines = [[CGPoint]]()
    
    enum positions{
        case top, topRight, bottomRight, bottom, bottomLeft, topLeft
    }
    
    override init(){
        super.init()
        fillColor = Colours.red.CGColor
        strokeColor = Colours.red.CGColor
        lineWidth = 7.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initPoints(position: positions, width: CGFloat, height: CGFloat){
        switch position {
        case .top:
            
            //  First Cubic Spline
            firstPoint = CGPoint(x: 0, y: 0)
            secondPoint = CGPoint(x: width, y: 0)
            thirdPoint = CGPoint(x: width/2, y: 0)
            
            //  Second "Triangle"
            fourthPoint = CGPoint(x: width/(4*2), y: 0)
            fifthPoint = CGPoint(x: width - width/(4*2), y: 0)
            sixthPoint = CGPoint(x: width/2, y: height/2)   //  Center of View
            
            //  Third "Triangle"
            seventhPoint = CGPoint(x: width/(4*8), y: 0)
            eighthPoint = CGPoint(x: width - width/(4*8), y: 0)
            ninthPoint = CGPoint(x: width/2, y: height/2)   //  Center of View
            
        case .topRight:
            print("You wanna topRight slice?  On the way!")
        case .bottomRight:
            print("You wanna bottomRight slice?  On the way!")
        case .bottom:
            print("You wanna bottom slice?  On the way!")
        case .bottomLeft:
            print("You wanna bottomLeft slice?  On the way!")
        case .topLeft:
            print("You wanna topLeft slice?  On the way!")
        }
    }
    
    func startingPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: width, y: 0.0))
        path.addLineToPoint(CGPoint(x: width, y: height/2))
        path.addLineToPoint(CGPoint(x: width, y: height/4))
        path.closePath()
        return path
    }
    
    func secondPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: width, y: height/8))
        path.addLineToPoint(CGPoint(x: width, y: height/4))
        path.addQuadCurveToPoint(CGPoint(x: width/2, y: height/2), controlPoint: CGPoint(x: (width*3)/4, y: (height*3/8)))
        path.addQuadCurveToPoint(CGPoint(x: width, y: height/8), controlPoint: CGPoint(x: (width*3)/4, y: (height/8)))
        path.closePath()
        return path
    }
    
    func thirdPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: width, y: height/4))
        path.addLineToPoint(CGPoint(x: width, y: height/4))
        path.addQuadCurveToPoint(CGPoint(x: width/2, y: height/2), controlPoint: CGPoint(x: width*3/4, y: height*15/32))
        path.addQuadCurveToPoint(CGPoint(x: width, y: height/4), controlPoint: CGPoint(x: (width*5)/8, y: height/4))
        path.closePath()
        return path
    }
    
    func fourthPath(width: CGFloat, height: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: width*3/4, y: height*7/16))
        path.addLineToPoint(CGPoint(x: width*3/4, y: height*7/16))
        path.addQuadCurveToPoint(CGPoint(x: width/2, y: height/2), controlPoint: CGPoint(x: width*23/32, y: height*31/64))
        path.addQuadCurveToPoint(CGPoint(x: width*3/4, y: height*7/16), controlPoint: CGPoint(x: width*5/8, y: height*5/16))
        path.closePath()
        return path
    }

    func fifthPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let theta = atan((height/2)/(width/2))      //angle
        let theta2 = theta/2
        let radius = width/4
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: cos(theta)*radius + width/2, y: height/2 - sin(theta)*radius))
        path.addQuadCurveToPoint(CGPoint(x: (width/2)+radius, y: height/2), controlPoint: CGPoint(x: cos(theta2)*radius + width/2, y: height/2 - sin(theta2)*radius))
        path.addLineToPoint(CGPoint(x: width/2, y: height/2))
        path.closePath()
        return path
    }
    
    func animate(position: positions, width: CGFloat, height: CGFloat){
        initPoints(position, width: width, height: height)
        
        let path1 = startingPath(width, height: height).CGPath
        let path2 = secondPath(width, height: height).CGPath
        let path3 = thirdPath(width, height: height).CGPath
        let path4 = fourthPath(width, height: height).CGPath
        let path5 = fifthPath(width, height: height).CGPath
        
        //  Animation Durations
        let d1 = 0.5
        let d2 = 0.4
        let d3 = 0.7
        let d4 = 0.4
        
        animationDuration = d1 + d2 + d3 + d4
        
        let startAnimation : CABasicAnimation = CABasicAnimation(keyPath: "path")
        startAnimation.fromValue = path1
        startAnimation.toValue = path2
        startAnimation.beginTime = 0.0
        startAnimation.duration = d1
        
        let secondAnimation : CABasicAnimation = CABasicAnimation(keyPath: "path")
        secondAnimation.fromValue = path2
        secondAnimation.toValue = path3
        secondAnimation.beginTime = startAnimation.beginTime + startAnimation.duration
        secondAnimation.duration = d2
        
        let thirdAnimation : CABasicAnimation = CABasicAnimation(keyPath: "path")
        thirdAnimation.fromValue = path3
        thirdAnimation.toValue = path4
        thirdAnimation.beginTime = secondAnimation.beginTime + secondAnimation.duration
        thirdAnimation.duration = d3
        
        let fourthAnimation : CABasicAnimation = CABasicAnimation(keyPath: "path")
        fourthAnimation.fromValue = path4
        fourthAnimation.toValue = path5
        fourthAnimation.beginTime = thirdAnimation.beginTime + thirdAnimation.duration
        fourthAnimation.duration = d4
        
        let shrinkAnimationGroup : CAAnimationGroup = CAAnimationGroup()
        shrinkAnimationGroup.animations = [startAnimation, secondAnimation, thirdAnimation, fourthAnimation]
        shrinkAnimationGroup.duration = fourthAnimation.beginTime + fourthAnimation.duration
        shrinkAnimationGroup.fillMode = kCAFillModeForwards
        shrinkAnimationGroup.removedOnCompletion = false
        addAnimation(shrinkAnimationGroup, forKey: nil)
    }

}