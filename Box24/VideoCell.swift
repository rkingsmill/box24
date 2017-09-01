//
//  VideoCell.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-07-29.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    let workoutImage = UIImageView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
    
    
        
        let photoAdjustmentManager = PhotoAdjustmentManager()
        
        //add separator lines between cells
        backgroundColor = .white
        let sepLine = UIView.init(frame: CGRect(x: 0, y: self.contentView.frame.size.height - 2.0, width: self.contentView.frame.size.width, height: 2))
        sepLine.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        self.contentView.addSubview(sepLine)
        sepLine.isHidden = false

        addSubview(workoutImage)
        addSubview(nameLabel)
        
        workoutImage.anchor(nil, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        workoutImage.anchorCenterYToSuperview()
        
        nameLabel.anchor(nil, left: workoutImage.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: 300, heightConstant: 50)
        nameLabel.anchorCenterYToSuperview()
        
        //set image as a circle
        workoutImage.image = photoAdjustmentManager.addfilter(image: #imageLiteral(resourceName: "kickboxing"))
        workoutImage.contentMode = .scaleAspectFill
        workoutImage.layer.masksToBounds = true
        workoutImage.layer.cornerRadius = workoutImage.frame.height/2
        workoutImage.clipsToBounds = true
        workoutImage.layer.borderWidth = 2
        workoutImage.layer.borderColor = UIColor(r: 230, g: 230, b: 230).cgColor
    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Kickboxing"
        label.font = UIFont(name: "HelveticaNeue", size: 25)
        label.textColor = UIColor.darkGray
        return label
    }()

}

class VideoListHeader: UICollectionViewCell {
    
    var workout: Workout? {
        didSet {
            imageView.image = workout?.image
            textLabel.text = workout?.name
        }
    }
    
    let imageView: UIImageView = {
        let photoAdjustmentManager = PhotoAdjustmentManager()
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = photoAdjustmentManager.addfilter(image: #imageLiteral(resourceName: "warmup-1"))
        return iv
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "TEXT IS WORKING"
        label.font = UIFont(name: "HelveticaNeue", size: 35)
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
        backgroundColor = .white

        let separatorLineView: UIView = {
            let lineView = UIView()
            lineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
            lineView.isHidden = false
            return lineView
        }()
        
        clipsToBounds = true
        self.contentView.addSubview(separatorLineView)
        
        separatorLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 2)
        
        addSubview(imageView)
        
        imageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        addSubview(textLabel)
        textLabel.anchorCenterXToSuperview()
        textLabel.anchorCenterYToSuperview()
        
        let navBarSeparatorViewBottom = UIView()
        navBarSeparatorViewBottom.backgroundColor = UIColor(r: 251, g: 98, b: 78)
        addSubview(navBarSeparatorViewBottom)
        navBarSeparatorViewBottom.anchor(nil, left: leftAnchor, bottom: bottomAnchor , right:rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 3)
    }
}



