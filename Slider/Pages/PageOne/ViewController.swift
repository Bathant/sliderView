//
//  ViewController.swift
//  Slider
//
//  Created by Macbook Pro on 5/30/19.
//  Copyright © 2019 Macbook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var realTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var littleConstraint: NSLayoutConstraint!
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondViewContainer: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var clickableView: UIView!
    var constraint : NSLayoutConstraint!
    var anotherConstraint : NSLayoutConstraint!
    var delegate : PageChangeDelegate?
    var firstVC : UIViewController  = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing:  FirstViewController.self))
        return vc
    }()
    var secondVC : UIViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing:  SecondViewController.self))
        return vc
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "title"
        self.firstView.translatesAutoresizingMaskIntoConstraints = false
        self.secondView.translatesAutoresizingMaskIntoConstraints = false
        self.clickableView.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        clickableView.addGestureRecognizer(tap)
        displayContentController(content: firstVC, parentView: firstView)
        displayContentController(content: secondVC, parentView: secondViewContainer)
        setNav()
     }
    func setNav(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "wallet_ic") , style: .done, target: self, action: #selector(goToNextPage))
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
     
        realTopConstraint.priority = UILayoutPriority(rawValue: hide ? 998 : 999)
        littleConstraint.priority = UILayoutPriority(rawValue: hide ? 999 : 998)
        self.arrow.transform = hide ?   CGAffineTransform.identity:  CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        circleImage.isHidden = hide ? false : true
        arrow.center = hide ? circleImage.center : clickableView.center
        clickableView.backgroundColor =  hide ?  UIColor(red: 52/255, green: 116/255, blue: 189/255, alpha: 1.0) : .black
    }
    @IBAction func walletBtn(_ sender: Any) {
     
    }
    @objc func goToNextPage(){
           delegate?.goNextPage?(viewController: self.navigationController!)
    }
    }


extension UIViewController {
    func displayContentController(content: UIViewController, parentView: UIView) {
        addChild(content)
        parentView.addSubview(content.view)
        content.didMove(toParent: self)
    }
    func hideContentController(content: UIViewController) {
        content.willMove(toParent: nil)
        content.view.removeFromSuperview()
        content.removeFromParent()
    }
    
}

