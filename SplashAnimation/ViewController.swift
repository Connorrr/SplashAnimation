//
//  ViewController.swift
//  SplashAnimation
//
//  Created by Connor Reid on 1/11/2016.
//  Copyright © 2016 Connor Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HolderViewDelegate {
    
    var holderView = HolderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addHolderView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addHolderView() {
        holderView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.bounds.width,
                                  height: view.bounds.height)
        holderView.delegate = self
        view.addSubview(holderView)
        holderView.addPieces()
    }
    
    func animateLabel() {
        
        let letter = UILabel(frame: view.frame)
        letter.textColor = Colours.blue
        letter.font = UIFont(name: "HelveticaNeue-Thin", size: 100)
        letter.textAlignment = .Center
        letter.text = "dC"
        letter.transform = CGAffineTransformScale(letter.transform, 0.25, 0.25)
        view.addSubview(letter)
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            letter.transform = CGAffineTransformScale(letter.transform, 4.0, 4.0)
        }), completion: ({ finished in
            self.addButton()
        }))
    }
    
    func addButton() {
        let button = UIButton()
        button.frame = CGRectMake(0.0, 0.0, view.bounds.width, view.bounds.height)
        button.addTarget(self, action: #selector(ViewController.buttonPressed(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }
    
    func buttonPressed(sender: UIButton!) {
        holderView.removeFromSuperview()
        view.subviews.map({ $0.removeFromSuperview() })
        holderView = HolderView(frame: CGRectZero)
        addHolderView()
    }

}

