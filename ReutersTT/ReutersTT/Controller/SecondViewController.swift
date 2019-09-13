//
//  SecondViewController.swift
//  ReutersTT
//
//  Created by Anton Skomarovskyi on 9/11/19.
//  Copyright © 2019 Anton Skomarovskyi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let segmentedItems = ["Sub Tab 1", "Sub Tab 2"]
    private let firstTableItems: NSArray = ["One","Two","Three"]
    private let secondTableItems: NSArray = ["Uno","Dos","Tres"]
    private let sectionHeading = "first sub tab first section heading"
    private var barHeight: CGFloat = 0.0
    
    private var tableView: UITableView!
    
    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: segmentedItems)
        control.translatesAutoresizingMaskIntoConstraints = false
        control.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        control.backgroundColor = UIColor.white
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(handleSegmentChanges), for: .valueChanged)
        
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        addSegements()
        
        addTableView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstTableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondTabTVCell")  as! SecondTabTVCell
        cell.mainTitle.text = "\(firstTableItems[indexPath.row])"
        cell.descriptionTitle.text = "\(secondTableItems[indexPath.row])"
        
        cell.separatorInset = .init(top: 1, left: 1, bottom: 1, right: 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeading
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    private func setupUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.title = "Tab 2"
        
        barHeight = UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.size.height)!
    }
    
    private func addSegements(){
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: barHeight + 10),
            segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 13),
            segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -13),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addTableView(){
        let startPositionY: CGFloat = barHeight + segmentedControl.frame.size.height + 13
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: startPositionY, width: displayWidth, height: displayHeight), style: .grouped)
        
        tableView.register(SecondTabTVCell.self, forCellReuseIdentifier: "secondTabTVCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .singleLine
        
        self.view.addSubview(tableView)
    }
    
    @objc private func handleSegmentChanges(){
        
    }
}

