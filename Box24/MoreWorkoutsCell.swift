//
//  MoreWorkoutsCell.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-07-29.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import UIKit

class MoreWorkoutsCell: UICollectionViewCell {
    
    let workoutImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "kickboxing")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        lineView.isHidden = false
        return lineView
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "TEXT IS WORKING"
        label.font = UIFont(name: "HelveticaNeue", size: 30)
        label.textColor = UIColor.white
        label.backgroundColor = .clear
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        clipsToBounds = true
        addSubview(separatorLineView)
        separatorLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        
        addSubview(workoutImage)
        workoutImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        addSubview(textLabel)
        textLabel.anchorCenterXToSuperview()
        textLabel.anchorCenterYToSuperview()
        
    }
}
