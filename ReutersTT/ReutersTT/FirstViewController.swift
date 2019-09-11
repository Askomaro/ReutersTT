//
//  FirstViewController.swift
//  ReutersTT
//
//  Created by Anton Skomarovskyi on 9/11/19.
//  Copyright © 2019 Anton Skomarovskyi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = UIColor.green
        self.title = "Tab 1"
    }


}

