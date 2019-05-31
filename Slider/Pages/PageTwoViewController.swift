//
//  PageTwoViewController.swift
//  Slider
//
//  Created by Macbook Pro on 5/31/19.
//  Copyright © 2019 Macbook Pro. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController {
    var delegate : PageChangeDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_ sender: Any) {
      delegate?.goPreviousPage?(viewController: self)
    }
    

}
