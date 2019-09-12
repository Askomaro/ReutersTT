//
//  FirstViewController.swift
//  ReutersTT
//
//  Created by Anton Skomarovskyi on 9/11/19.
//  Copyright © 2019 Anton Skomarovskyi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let myArray: NSArray = ["First","Second","Third"]
    private let sectionHeading = "first tab section heading"
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        addTableView()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeading
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTabTVCell")  as! FirstTabTVCell
        cell.leftLabelTitle.text = "\(myArray[indexPath.row])"
        cell.rightLabelTitle.text = "\(myArray[indexPath.row])"
        
        // TODO: fix it, show separator for last cell
        if (indexPath.row == myArray.count-2) {
            cell.separatorInset = UIEdgeInsets.init(top: 0.0, left: 25.0, bottom: 0.0, right: 25.0)
        }
        
        return cell
    }
    
    private func setUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = UIColor.lightGray
        self.title = "Tab 1"
    }
    
    private func addTableView(){
        // TODO: change adding height of navigationBar
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.size.height)!
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
    
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight), style: .grouped)
    
        tableView.register(FirstTabTVCell.self, forCellReuseIdentifier: "firstTabTVCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        
        self.view.addSubview(tableView)
    }
}

