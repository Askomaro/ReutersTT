//
//  FirstTabTVCell.swift
//  ReutersTT
//
//  Created by Anton Skomarovskyi on 9/11/19.
//  Copyright © 2019 Anton Skomarovskyi. All rights reserved.
//

import UIKit

class FirstTabTVCell: UITableViewCell {
    
    var leftLabelTitle : UILabel = {
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.textAlignment = .left
        
        return label
    }()
    
    var rightLabelTitle : UILabel = {
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.textAlignment = .right
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(leftLabelTitle)
        self.addSubview(rightLabelTitle)
    }
    
    override func layoutSubviews() {
        // Calculate exact center Y position and apply the same value for other paddings
        // Considering leftLabelTitle.font.pointSize == rightLabelTitle.font.pointSize
        let spaceConstant = CGFloat(Int(self.frame.size.height - leftLabelTitle.font.pointSize) / 2)
        
        leftLabelTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: spaceConstant).isActive = true
        leftLabelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: spaceConstant).isActive = true
        
        rightLabelTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -spaceConstant).isActive = true
        rightLabelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: spaceConstant).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
