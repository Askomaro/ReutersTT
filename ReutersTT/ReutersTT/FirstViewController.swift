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
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = UIColor.lightGray
        self.title = "Tab 1"
        
        addTableView()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeading
    }
    
    // TODO: Delete it as it's unneeded
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//        print("Value: \(myArray[indexPath.row])")
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        return cell
    }
    
    private func addTableView(){
        // TODO: change adding height of navigationBar
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.size.height)!
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
    
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight), style: .grouped)
    
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.isScrollEnabled = false
        myTableView.allowsSelection = false
        
        self.view.addSubview(myTableView)
    }
}

