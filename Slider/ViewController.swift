//
//  ViewController.swift
//  Slider
//
//  Created by Macbook Pro on 5/30/19.
//  Copyright © 2019 Macbook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var clickableView: UIView!
    var constraint : NSLayoutConstraint!
    var anotherConstraint : NSLayoutConstraint!
//
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "bad"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        clickableView.addGestureRecognizer(tap)
        constraint =  self.secondView.topAnchor.constraint(equalTo: self.firstView.topAnchor, constant: 0)
    
    }
    
    @objc func viewClicked(){
  
        UIView.animate(withDuration:0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        if self.secondView.center != self.firstView.center{
                            self.toggleViews(hide: false)
                        }else{
                            self.toggleViews(hide: true)
                        }
                       
                        self.view.layoutIfNeeded()

        }, completion: nil)
    }

    func toggleViews(hide : Bool){
        self.constraint.isActive = hide ? false : true
        self.arrow.transform = hide ?   CGAffineTransform.identity:  CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        circleImage.isHidden = hide ? false : true
        arrow.center = hide ? circleImage.center : clickableView.center
        clickableView.backgroundColor =  hide ?  UIColor(red: 52/255, green: 116/255, blue: 189/255, alpha: 1.0) : .black
    }
        
    }




