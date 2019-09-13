//
//  SecondTabTVCell.swift
//  ReutersTT
//
//  Created by Anton Skomarovskyi on 9/12/19.
//  Copyright © 2019 Anton Skomarovskyi. All rights reserved.
//

import UIKit

class SecondTabTVCell: UITableViewCell {

    var mainTitle : UILabel = {
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    var descriptionTitle : UILabel = {
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(mainTitle)
        self.addSubview(descriptionTitle)
    }
    
    override func layoutSubviews() {
        mainTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 13).isActive = true
        mainTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        
        descriptionTitle.leftAnchor.constraint(equalTo: mainTitle.leftAnchor, constant: 1).isActive = true
        descriptionTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
