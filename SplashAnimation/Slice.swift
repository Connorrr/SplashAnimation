//
//  ScreenPieceLayer.swift
//  SplashAnimation
//
//  Created by Connor Reid on 1/11/2016.
//  Copyright © 2016 Connor Reid. All rights reserved.
//

import UIKit

class Slice: CAShapeLayer {
    
    var animationDuration = 0.0
    
    private var splines = [[CGPoint]]()
    
    enum positions{
        case top, topRight, bottomRight, bottom, bottomLeft, topLeft
    }
    
    override init(){
        super.init()
        fillColor = Colours.red.CGColor
        strokeColor = Colours.red.CGColor
        lineWidth = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initPoints(position: positions, width: CGFloat, height: CGFloat){
        let centerPoint = CGPoint(x: width/2, y: height/2)
        switch position {
        case .top:
            
            print("You wanna top slice?  On the way!")
            
        case .topRight:
            fillColor = Colours.red.CGColor
            strokeColor = Colours.red.CGColor
            
            let refAngle = CGFloat(M_PI) - atan((height/2)/(width/2))
            let refAngle2 = CGFloat(M_PI) - atan((height/2)/(width/2))/2
            let refAngle3 = CGFloat(M_PI) - atan((height/2)/(width/2))/8
           
            //  Starting Points (Boarder Line)
            var firstPoint = CGPoint(x: width, y: 0)        //  Top
            var secondPoint = CGPoint(x: width, y: height/2)   //  Bottom
            var thirdPoint = CGPoint(x: width, y: height/4)  //  Middle
            var fourthPoint = CGPointZero
            let first = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(first)
            
            //  First Triangle
            firstPoint = CGPoint(x: width, y: 0)            //  Top
            secondPoint = CGPoint(x: width, y: height/2)    //  Bottom
            thirdPoint = getRadiusPoint(refAngle, radius: height/4, width: width, height: height)
            fourthPoint = CGPointZero
            let second = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(second)
            
            //  third Shape Cubic Spline (Top) (b)
            firstPoint = CGPoint(x: width, y: 0)
            secondPoint = CGPoint(x: width/2, y: height/8)
            thirdPoint = getRadiusPoint(refAngle, radius: 3*height/8, width: width, height: height)
            fourthPoint = centerPoint
            let third = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(third)
            
            //  third Shape Cubic Spline (Bottom) (a)
            firstPoint = CGPoint(x: width, y: height/2)
            secondPoint = CGPoint(x: width/2, y: 3*height/8)
            thirdPoint = getRadiusPoint(refAngle, radius: height/8, width: width, height: height)
            fourthPoint = centerPoint
            let fourth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(fourth)
            
            //  fourth Shape Cubic Splines (Top) (d)
            firstPoint = CGPoint(x: width, y: height/4)
            secondPoint = CGPoint(x: width/2, y: height/8)
            thirdPoint = getRadiusPoint(refAngle3, radius: 3*height/8, width: width, height: height)
            fourthPoint = centerPoint
            let fifth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(fifth)
            
            //  fourth Shape Cubic Splines (Bottom) (c)
            firstPoint = CGPoint(x: width, y: height/4)
            secondPoint = getRadiusPoint(refAngle, radius: height/8, width: width, height: height)
            thirdPoint = secondPoint
            fourthPoint = centerPoint
            let sixth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(sixth)
            
            //  fifth Shape Cubic Splines (Top) (f)
            firstPoint = getRadiusPoint(refAngle, radius: width/4, width: width, height: height)
            secondPoint = CGPoint(x: width/4, y: height/2)
            thirdPoint = secondPoint
            fourthPoint = centerPoint
            let seventh = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            dump(seventh)
            splines.append(seventh)
            
            //  fifth Shape Cubic Splines (Bottom) (e)
            firstPoint = getRadiusPoint(refAngle, radius: width/4, width: width, height: height)
            secondPoint = getRadiusPoint(CGFloat(M_PI*3/8), radius: width/8, width: width, height: height)
            thirdPoint = secondPoint
            fourthPoint = centerPoint
            let eighth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            dump(eighth)
            splines.append(eighth)
            
            //  sixth Shape Arc
            firstPoint = CGPoint(x: width/4, y: height/2)
            secondPoint = getRadiusPoint(refAngle2, radius: width/4, width: width, height: height)
            thirdPoint = getRadiusPoint(refAngle, radius: width/4, width: width, height: height)
            fourthPoint = centerPoint
            let ninth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(ninth)
            
        case .bottomRight:
            print("You wanna bottomRight slice?  On the way!")
        case .bottom:
            print("You wanna bottom slice?  On the way!")
        case .bottomLeft:
            fillColor = Colours.purple.CGColor
            strokeColor = Colours.purple.CGColor
            
            let refAngle = CGFloat(2*M_PI) - atan((height/2)/(width/2))
            let refAngle2 = CGFloat(2*M_PI) - atan((height/2)/(width/2))/2
            let refAngle3 = CGFloat(2*M_PI) - atan((height/2)/(width/2))/8
            
            //  Starting Points (Boarder Line)
            var firstPoint = CGPoint(x: 0, y: height)        //  Top
            var secondPoint = CGPoint(x: 0, y: height/2)   //  Bottom
            var thirdPoint = CGPoint(x: 0, y: height*3/4)  //  Middle
            var fourthPoint = CGPointZero
            let first = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(first)
            
            //  First Triangle
            firstPoint = CGPoint(x: 0, y: height)            //  Top
            secondPoint = CGPoint(x: 0, y: height/2)    //  Bottom
            thirdPoint = getRadiusPoint(refAngle, radius: height/4, width: width, height: height)
            fourthPoint = CGPointZero
            let second = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(second)
            
            //  third Shape Cubic Spline (Top) (b)
            firstPoint = CGPoint(x: 0, y: height)
            secondPoint = CGPoint(x: width/2, y: height*7/8)
            thirdPoint = getRadiusPoint(refAngle, radius: 3*height/8, width: width, height: height)
            fourthPoint = centerPoint
            let third = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(third)
            
            //  third Shape Cubic Spline (Bottom) (a)
            firstPoint = CGPoint(x: 0, y: height/2)
            secondPoint = CGPoint(x: width/2, y: 5*height/8)
            thirdPoint = getRadiusPoint(refAngle, radius: height/8, width: width, height: height)
            fourthPoint = centerPoint
            let fourth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(fourth)
            
            //  fourth Shape Cubic Splines (Top) (d)
            firstPoint = CGPoint(x: 0, y: height*3/4)
            secondPoint = CGPoint(x: width/2, y: height*7/8)
            thirdPoint = getRadiusPoint(refAngle3, radius: 3*height/8, width: width, height: height)
            fourthPoint = centerPoint
            let fifth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(fifth)
            
            //  fourth Shape Cubic Splines (Bottom) (c)
            firstPoint = CGPoint(x: 0, y: height*3/4)
            secondPoint = getRadiusPoint(refAngle, radius: height/8, width: width, height: height)
            thirdPoint = secondPoint
            fourthPoint = centerPoint
            let sixth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(sixth)
            
            //  fifth Shape Cubic Splines (Top) (f)
            firstPoint = getRadiusPoint(refAngle, radius: width/4, width: width, height: height)
            secondPoint = CGPoint(x: width*3/4, y: height/2)
            thirdPoint = secondPoint
            fourthPoint = centerPoint
            let seventh = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            dump(seventh)
            splines.append(seventh)
            
            //  fifth Shape Cubic Splines (Bottom) (e)
            firstPoint = getRadiusPoint(refAngle, radius: width/4, width: width, height: height)
            secondPoint = getRadiusPoint(CGFloat(M_PI+(M_PI*3/8)), radius: width/8, width: width, height: height)
            thirdPoint = secondPoint
            fourthPoint = centerPoint
            let eighth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            dump(eighth)
            splines.append(eighth)
            
            //  sixth Shape Arc
            firstPoint = CGPoint(x: width*3/4, y: height/2)
            secondPoint = getRadiusPoint(refAngle2, radius: width/4, width: width, height: height)
            thirdPoint = getRadiusPoint(refAngle, radius: width/4, width: width, height: height)
            fourthPoint = centerPoint
            let ninth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(ninth)
        case .topLeft:
            fillColor = Colours.blue.CGColor
            strokeColor = Colours.blue.CGColor
            
            let refAngle = CGFloat(M_PI) + atan((height/2)/(width/2))
            let refAngle2 = CGFloat(2*M_PI) - atan((height/2)/(width/2))
            
            //  Starting Points (Boarder Line)
            var firstPoint = CGPoint(x: 0, y: 0)        //  Top
            var secondPoint = CGPoint(x: 0, y: height/2)   //  Bottom
            var thirdPoint = CGPoint(x: 0, y: height/4)  //  Middle
            var fourthPoint = CGPointZero
            let first = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(first)
            
            //  First Triangle
            firstPoint = CGPoint(x: 0, y: 0)            //  Top
            secondPoint = CGPoint(x: 0, y: height/2)    //  Bottom
            thirdPoint = CGPoint(x: width/4, y: height/2)
            fourthPoint = CGPointZero
            let second = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(second)
            
            //  third Shape Cubic Spline (Top) (b)
            firstPoint = CGPoint(x: 0, y: 0)
            secondPoint = getRadiusPoint(refAngle, radius: width/4, width: width, height: height)
            thirdPoint = secondPoint
            fourthPoint = secondPoint
            let third = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(third)
            
            //  third Shape Cubic Spline (Bottom) (a)
            firstPoint = CGPoint(x: 0, y: height/2)
            secondPoint = getRadiusPoint(refAngle, radius: width/4, width: width, height: height)
            thirdPoint = secondPoint
            fourthPoint = secondPoint
            let fourth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(fourth)
            
            //  fourth Shape Cubic Splines (Top) (d)
            firstPoint = CGPoint(x: 0, y: height/4)
            secondPoint = getRadiusPoint(refAngle, radius: width/8, width: width, height: height)
            thirdPoint = secondPoint
            fourthPoint = centerPoint
            let fifth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(fifth)
            
            //  fourth Shape Cubic Splines (Bottom) (c)
            firstPoint = CGPoint(x: 0, y: height/4)
            secondPoint = getRadiusPoint(refAngle, radius: width*3/8, width: width, height: height)
            thirdPoint = secondPoint        //  TODO:  Check that this looks swell
            fourthPoint = centerPoint
            let sixth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(sixth)
            
            //  fifth Shape Cubic Splines (Top) (f)
            firstPoint = getRadiusPoint(refAngle, radius: width*3/8, width: width, height: height)
            secondPoint = getRadiusPoint(refAngle, radius: width/8, width: width, height: height)
            thirdPoint = secondPoint
            fourthPoint = centerPoint
            let seventh = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            dump(seventh)
            splines.append(seventh)
            
            //  fifth Shape Cubic Splines (Bottom) (e)
            firstPoint = getRadiusPoint(refAngle, radius: width*3/8, width: width, height: height)
            secondPoint = getRadiusPoint(refAngle2, radius: width/4, width: width, height: height)
            thirdPoint = secondPoint
            fourthPoint = centerPoint
            let eighth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            dump(eighth)
            splines.append(eighth)
            
            //  sixth Shape Arc
            firstPoint = getRadiusPoint(refAngle, radius: width/4, width: width, height: height)
            secondPoint = CGPoint(x: width/2, y: 3*height/4)
            thirdPoint = getRadiusPoint(refAngle2, radius: width/4, width: width, height: height)
            fourthPoint = centerPoint
            let ninth = [firstPoint, secondPoint, thirdPoint, fourthPoint]
            splines.append(ninth)
        }
    }
    
    func getRadiusPoint(theta: CGFloat, radius: CGFloat, width: CGFloat, height: CGFloat) -> CGPoint{
        let point = CGPoint(x: cos(theta)*radius + width/2, y: height/2 - sin(theta)*radius)
        return point
    }
    
    func startingPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.moveToPoint(splines[0][0])
        path.addLineToPoint(splines[0][1])
        path.addLineToPoint(splines[0][2])
        path.closePath()
        return path
    }
    
    func secondPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.moveToPoint(splines[1][0])
        path.addLineToPoint(splines[1][1])
        path.addLineToPoint(splines[1][2])
        path.closePath()
        return path
    }
    
    func thirdPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.moveToPoint(splines[2][0])     // Top
        path.addLineToPoint(splines[3][0])  //  Bottom
        path.addCurveToPoint(splines[3][3], controlPoint1: splines[3][1], controlPoint2: splines[3][2]) // Bottom Curve
        path.addCurveToPoint(splines[2][0], controlPoint1: splines[2][2], controlPoint2: splines[2][1]) // Top  Curve
        path.closePath()
        return path
    }
    
    func fourthPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.moveToPoint(splines[4][0])     // Top
        path.addLineToPoint(splines[5][0])  //  Bottom
        path.addCurveToPoint(splines[5][3], controlPoint1: splines[5][1], controlPoint2: splines[5][2]) // Bottom Curve
        path.addCurveToPoint(splines[4][0], controlPoint1: splines[4][2], controlPoint2: splines[4][1]) // Top  Curve
        path.closePath()
        return path
    }
    
    func fifthPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.moveToPoint(splines[6][0])     // Top
        path.addLineToPoint(splines[7][0])  //  Bottom
        path.addCurveToPoint(splines[7][3], controlPoint1: splines[7][1], controlPoint2: splines[7][2]) // Bottom Curve
        path.addCurveToPoint(splines[6][0], controlPoint1: splines[6][2], controlPoint2: splines[6][1]) // Top  Curve
        path.closePath()
        return path
    }

    func sixthPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let path = UIBezierPath()
        path.moveToPoint(splines[8][0])
        path.addQuadCurveToPoint(splines[8][2], controlPoint: splines[8][1])
        path.addLineToPoint(splines[8][3])
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
        let path6 = sixthPath(width, height: height).CGPath
        
        //  Animation Durations
        let d1 = 0.3
        let d2 = 0.3
        let d3 = 0.3
        let d4 = 0.3
        let d5 = 0.4
        
        animationDuration = d1 + d2 + d3 + d5
        
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
        
        let fifthAnimation : CABasicAnimation = CABasicAnimation(keyPath: "path")
        fifthAnimation.fromValue = path5
        fifthAnimation.toValue = path6
        fifthAnimation.beginTime = fourthAnimation.beginTime + fourthAnimation.duration
        fifthAnimation.duration = d5
        
        let shrinkAnimationGroup : CAAnimationGroup = CAAnimationGroup()
        shrinkAnimationGroup.animations = [startAnimation, secondAnimation, thirdAnimation, fourthAnimation, fifthAnimation]
        shrinkAnimationGroup.duration = fifthAnimation.beginTime + fifthAnimation.duration
        shrinkAnimationGroup.fillMode = kCAFillModeForwards
        shrinkAnimationGroup.removedOnCompletion = false
        addAnimation(shrinkAnimationGroup, forKey: nil)
    }

}