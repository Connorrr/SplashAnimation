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
    
    let topRightPiece = TopRightPieceLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colours.clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addPieces() {
        layer.addSublayer(topRightPiece)
        topRightPiece.animate(TopRightPieceLayer.positions.topRight, width: frame.size.width, height: frame.size.height)
        NSTimer.scheduledTimerWithTimeInterval(topRightPiece.animationDuration, target: self, selector: #selector(self.endSplash), userInfo: nil, repeats: false)
    }
    
    func beginCircleTwirl(){
        //topRightPiece.lin
    }
    
    func endSplash(){
        delegate?.addButton()
    }
}
