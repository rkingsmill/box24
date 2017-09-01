//
//  FitnessTechniqueController.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-07-29.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import UIKit

class FitnessTechniqueController : UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var fitnessTechniqueModel = FitnessTechniqueModel()
    var workout: Workout? {
        didSet {
           
        }
    }

    var cellSize = CGSize()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        cellSize = CGSize(width:(self.view.frame.size.width)/2.1, height:(self.view.frame.size.width)/2.1)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(MoreWorkoutsCell.self, forCellWithReuseIdentifier: "moreWorkoutsCell")
    }
    
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moreWorkoutsCell", for: indexPath) as! MoreWorkoutsCell
        cell.workoutImage.image = fitnessTechniqueModel.fitnessOrTechnique[indexPath.item].image
        cell.textLabel.text = fitnessTechniqueModel.fitnessOrTechnique[indexPath.item].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let orientation = UIApplication.shared.statusBarOrientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {
            cellSize = CGSize(width:(self.view.frame.size.width)/2.09, height:(self.view.frame.size.height)/1.05)
            return cellSize
        }
        else{
            cellSize = CGSize(width:(self.view.frame.size.width)/1.05, height:(self.view.frame.size.height/2.1))
            return cellSize
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateCollectionViewLayout(with: size)
    }
    
    private func updateCollectionViewLayout(with size: CGSize) {
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = (size.width < size.height) ? cellSize : cellSize
            layout.invalidateLayout()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = Float(15)
        return UIEdgeInsetsMake(CGFloat(leftRightInset), CGFloat(leftRightInset), CGFloat(leftRightInset), CGFloat(leftRightInset))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return .zero
        }
        //
        return CGSize(width: collectionView.frame.width, height: 25)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.item == 0) {
            //let workout = fitnessTechniqueListDataSource.fitnessOrTechnique[indexPath.item]
            showVideoListForSelected(workout: workout!)
        }
        if (indexPath.item == 1) {
            //let workout = fitnessTechniqueListDataSource.fitnessOrTechnique[indexPath.item]
            showTechniqueList(workout: workout!)
        }
    }
    
    func showVideoListForSelected(workout: Workout) {
        let layout = UICollectionViewFlowLayout()
        let videoListController = VideoListController(collectionViewLayout: layout)
        videoListController.workout = workout
        navigationController?.pushViewController(videoListController, animated: true)
    }
    
    func showTechniqueList(workout: Workout) {
        let layout = UICollectionViewFlowLayout()
        let techniqueController = TechniqueController(collectionViewLayout: layout)
        techniqueController.workout = workout
        navigationController?.pushViewController(techniqueController, animated: true)
    }
}

extension FitnessTechniqueController {
    
    func setupNavigationBarItems() {
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
        navBarSeparatorView.backgroundColor = UIColor(r: 251, g: 98, b: 78)
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 3)
    }
    
}
