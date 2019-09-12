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
        
        return label
    }()
    
    var descriptionTitle : UILabel = {
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(mainTitle)
        self.addSubview(descriptionTitle)
    }
    
    override func layoutSubviews() {
        // Calculate exact center Y position and apply the same value for other paddings
        // Considering leftLabelTitle.font.pointSize == rightLabelTitle.font.pointSize
//        let spaceConstant = CGFloat(Int(self.frame.size.height - leftLabelTitle.font.pointSize) / 2)
        
        mainTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        mainTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        
        descriptionTitle.leftAnchor.constraint(equalTo: mainTitle.leftAnchor).isActive = true
        descriptionTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
