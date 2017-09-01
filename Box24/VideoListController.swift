//
//  VideoListController.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-07-29.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import UIKit

class VideoListController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var workout: Workout? {
        didSet {
            //navigationItem.title = workout?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "videoCell")
        collectionView?.register(VideoListHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "videoListHeader")
        
        setupNavigationBarItems()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView?.reloadData()
    }
    
    //MARK: Datasource methods
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCell
        cell.nameLabel.text = workout?.name
        cell.workoutImage.image = workout?.image
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let videoController = VideoViewController.init(workout: workout!)
        //videoController.workout = workout
        navigationController?.pushViewController(videoController, animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
           let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "videoListHeader", for: indexPath) as! VideoListHeader
            headerView.textLabel.text = workout?.name
            headerView.imageView.image = workout?.image

        return headerView
    }
    
    //MARK: FlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 250)
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateCollectionViewLayout(with: size)
    }
    
    private func updateCollectionViewLayout(with size: CGSize) {
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            
            //layout.itemSize = (size.width < size.height) ? cellSize : cellSize
            layout.invalidateLayout()
        }
    }
}

extension VideoListController {
    
    func setupNavigationBarItems() {
        //setupLeftNavItems()
        //setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        
        let titleFormatted = NSMutableAttributedString(string: "BOX24 FITNESS", attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue", size: 32.0)!])
        titleFormatted.addAttribute(NSForegroundColorAttributeName, value: UIColor(r: 251, g: 98, b: 78), range: NSRange(location:3,length:2))
        
        let navLabel = UILabel()
        navLabel.textColor = UIColor.darkGray
        navLabel.attributedText = titleFormatted
        navLabel.sizeToFit()
        self.navigationItem.titleView = navLabel
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        
        //colored bar
        let navBarSeparatorView = UIView()
        //navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        navBarSeparatorView.backgroundColor = UIColor(r: 251, g: 98, b: 78)
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 3)
        
    }
    
}
