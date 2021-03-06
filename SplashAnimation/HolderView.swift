//
//  HolderView.swift
//  SplashAnimation
//
//  Created by Connor Reid on 1/11/2016.
//  Copyright © 2016 Connor Reid. All rights reserved.
//

import UIKit

protocol HolderViewDelegate:class {
    func animateLabel()
}

class HolderView: UIView {
    
    weak var delegate:HolderViewDelegate?
    
    let topPiece = Slice()
    let topRightPiece = Slice()
    let topLeftPiece = Slice()
    let bottomLeftPiece = Slice()
    let bottomRightPiece = Slice()
    let bottomPiece = Slice()
    
    var ovalLayer = OvalLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colours.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPieces() {
        layer.addSublayer(topPiece)
        layer.addSublayer(topRightPiece)
        layer.addSublayer(topLeftPiece)
        layer.addSublayer(bottomLeftPiece)
        layer.addSublayer(bottomRightPiece)
        layer.addSublayer(bottomPiece)
        topPiece.animate(Slice.positions.top, width: frame.size.width, height: frame.size.height)
        topRightPiece.animate(Slice.positions.topRight, width: frame.size.width, height: frame.size.height)
        topLeftPiece.animate(Slice.positions.topLeft, width: frame.size.width, height: frame.size.height)
        bottomLeftPiece.animate(Slice.positions.bottomLeft, width: frame.size.width, height: frame.size.height)
        bottomRightPiece.animate(Slice.positions.bottomRight, width: frame.size.width, height: frame.size.height)
        bottomPiece.animate(Slice.positions.bottom, width: frame.size.width, height: frame.size.height)
        NSTimer.scheduledTimerWithTimeInterval(topRightPiece.animationDuration-0.4, target: self, selector: #selector(self.beginCircleTwirl), userInfo: nil, repeats: false)
    }
    
    func beginCircleTwirl() {
        let kAnimationKey = "rotation"
        
        if self.layer.animationForKey(kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = 0.9
            animate.repeatCount = 3
            animate.fromValue = 0.0
            animate.toValue = Float(M_PI * -2.0)
            animate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            self.layer.addAnimation(animate, forKey: kAnimationKey)
        }
        
        NSTimer.scheduledTimerWithTimeInterval(0.9*3, target: self, selector: #selector(self.stopRotating), userInfo: nil, repeats: false)
    }
    func stopRotating() {
        let kAnimationKey = "rotation"
        ovalLayer.frame = self.frame
        layer.addSublayer(ovalLayer)
        
        if self.layer.animationForKey(kAnimationKey) != nil {
            self.layer.removeAnimationForKey(kAnimationKey)
        }
        
        ovalLayer.expand()
        topPiece.openAnimation(frame.size.width, height: frame.size.height)
        topLeftPiece.openAnimation(frame.size.width, height: frame.size.height)
        bottomLeftPiece.openAnimation(frame.size.width, height: frame.size.height)
        bottomPiece.openAnimation(frame.size.width, height: frame.size.height)
        bottomRightPiece.openAnimation(frame.size.width, height: frame.size.height)
        topRightPiece.openAnimation(frame.size.width, height: frame.size.height)
        
        NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(self.endSplash), userInfo: nil, repeats: false)
    }
    
    func endSplash(){
        delegate?.animateLabel()
    }
}
