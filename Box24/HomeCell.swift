//
//  File.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-07-29.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    let workoutImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "kickboxing")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Kickboxing"
        //label.font = UIFont.boldSystemFont(ofSize: 36)
        label.font = UIFont(name: "HelveticaNeue", size: 30)
        label.textColor = .white
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Box24"
        //label.font = UIFont.systemFont(ofSize: 14)
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Kickboxing workout targets glutes, abs, arms, legs and back for a full-body workout"
        //textView.font = UIFont.systemFont(ofSize: 15)
        textView.font = UIFont(name: "HelveticaNeue", size: 15)
        textView.textColor = UIColor(r: 130, g: 130, b: 130)
        textView.backgroundColor = .clear
        textView.isEditable = false
        return textView
    }()
    
    let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        lineView.isHidden = true
        return lineView
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
            
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(workoutImage)
        addSubview(nameLabel)
        addSubview(bioTextView)
        
        workoutImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        nameLabel.anchorCenterXToSuperview()
        nameLabel.anchorCenterYToSuperview()
        
    }
}

extension UIColor {
    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(r: r, g: g, b: b, a: 1)
    }
    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
}
