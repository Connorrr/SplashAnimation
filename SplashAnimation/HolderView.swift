//
//  HolderView.swift
//  SplashAnimation
//
//  Created by Connor Reid on 1/11/2016.
//  Copyright © 2016 Connor Reid. All rights reserved.
//

import UIKit

protocol HolderViewDelegate:class {
    func addButton()
}

class HolderView: UIView {
    
    weak var delegate:HolderViewDelegate?
    
    let topRightPiece = Slice()
    let topLeftPiece = Slice()
    let bottomLeftPiece = Slice()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colours.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addPieces() {
        layer.addSublayer(topRightPiece)
        layer.addSublayer(topLeftPiece)
        layer.addSublayer(bottomLeftPiece)
        topRightPiece.animate(Slice.positions.topRight, width: frame.size.width, height: frame.size.height)
        topLeftPiece.animate(Slice.positions.topLeft, width: frame.size.width, height: frame.size.height)
        bottomLeftPiece.animate(Slice.positions.bottomLeft, width: frame.size.width, height: frame.size.height)
        NSTimer.scheduledTimerWithTimeInterval(topRightPiece.animationDuration, target: self, selector: #selector(self.endSplash), userInfo: nil, repeats: false)
    }
    
    func beginCircleTwirl(){
        //topRightPiece.lin
    }
    
    func endSplash(){
        delegate?.addButton()
    }
}
