//
//  PageViewController.swift
//  Slider
//
//  Created by Macbook Pro on 5/31/19.
//  Copyright © 2019 Macbook Pro. All rights reserved.
//

import UIKit
@objc protocol PageChangeDelegate {
    @objc optional func goNextPage(viewController:UIViewController)
    @objc optional func goPreviousPage(viewController:UIViewController)
}

class PageViewController: UIPageViewController {
    lazy var pages: [UIViewController] = {
        let firstPage = self.getViewController(withIdentifier: String(describing: ViewController.self) ) as! ViewController
        let nav = UINavigationController(rootViewController: firstPage)
        let secondPage =   self.getViewController(withIdentifier: String(describing: PageTwoViewController.self)) as! PageTwoViewController
        firstPage.delegate = self
        secondPage.delegate = self
        return [
            nav, secondPage
        ]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
    }


}

extension PageViewController: PageChangeDelegate {
    
    func goNextPage(viewController:UIViewController) {
        var desiredVC :UIViewController!
        guard let viewControllerIndex = pages.index(of: viewController) else { return }
        let nextIndex = viewControllerIndex + 1
        if  nextIndex < pages.count  {  desiredVC =  pages.first }
        guard pages.count > nextIndex else { return }
        desiredVC =  pages[nextIndex]
        setViewControllers([desiredVC], direction: .forward, animated: false)
    }
    func goPreviousPage(viewController:UIViewController) {
        var desiredVC :UIViewController!
        guard let viewControllerIndex = pages.index(of: viewController) else { return  }
        let previousIndex = viewControllerIndex - 1
        if previousIndex >= 0     { desiredVC =  pages.last }
        guard pages.count > previousIndex else { return  }
        desiredVC =  pages[previousIndex]
        setViewControllers([desiredVC], direction: .reverse, animated: false)
    }
}
