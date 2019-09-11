//
//  MainTabBarController.swift
//  ReutersTT
//
//  Created by Anton Skomarovskyi on 9/11/19.
//  Copyright © 2019 Anton Skomarovskyi. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tab1 = createFirstTabView()
        let tab2 = createSecondTabView()
        
        let viewControllerList = [tab1, tab2]
        
        //This allows to create a navigation controller for each view controller 
        self.viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
    
    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        
        return true;
    }
    
    private func createFirstTabView() -> UIViewController{
        let item = FirstViewController()
        let icon = UITabBarItem(title: "Tab 1", image: #imageLiteral(resourceName: "second"), tag: 0)
        item.tabBarItem = icon
        
        return item
    }
    
    private func createSecondTabView() -> UIViewController{
        let item = SecondViewController()
        let icon = UITabBarItem(title: "Tab 2", image: #imageLiteral(resourceName: "first"), tag: 1)
        item.tabBarItem = icon
        
        return item
    }
}
