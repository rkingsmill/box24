//
//  ViewController.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-07-29.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var homeModel = HomeModel()
    var cellSize = CGSize()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UICollectionView Datasource Methods -
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeModel.workouts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCell
        
        cell.workoutImage.image = homeModel.workouts[indexPath.item].image
        cell.nameLabel.text = homeModel.workouts[indexPath.item].name
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let workout = homeModel.workouts[indexPath.item]
        if (indexPath.item == 0) {
            //let workout = homeDatasource.workouts[indexPath.item]
            showVideoListForSelected(workout: workout)
        }
        //Add different models for each possibility
        if (indexPath.item == 1) {
            //let workout = homeDatasource.workouts[indexPath.item]
            showFitnessAndTechniqueList(workout: workout)
        }
        if (indexPath.item == 2) {
            //let workout = homeDatasource.workouts[indexPath.item]
            showFitnessAndTechniqueList(workout: workout)
        }
        if (indexPath.item == 3) {
            //let workout = homeDatasource.workouts[indexPath.item]
            showVideoListForSelected(workout: workout)
        }
    }
    
    //MARK: - CollectionViewDelegateFlowLayout Methods -
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let orientation = UIApplication.shared.statusBarOrientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {
            cellSize = CGSize(width:(self.view.frame.size.width)/2.09, height:(self.view.frame.size.height)/2.09)
            return cellSize
        }
        else{
            cellSize = CGSize(width:(self.view.frame.size.width)/2.11, height:(self.view.frame.size.height)/2.11)
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
    
    //MARK: - Methods -
    func showVideoListForSelected(workout: Workout) {
        let layout = UICollectionViewFlowLayout()
        let videoListController = VideoListController(collectionViewLayout: layout)
        videoListController.workout = workout
        navigationController?.pushViewController(videoListController, animated: true)
    }
    
    func showFitnessAndTechniqueList(workout: Workout) {
        let layout = UICollectionViewFlowLayout()
        let fitnessTechniqueController = FitnessTechniqueController(collectionViewLayout: layout)
        fitnessTechniqueController.workout = workout
        navigationController?.pushViewController(fitnessTechniqueController, animated: true)
    }
    
    // MARK: - Nagivation Controller SetUp -
    func setupNavigationBarItems() {
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        let titleFormatted = NSMutableAttributedString(string: "BOX24 FITNESS", attributes: [NSAttributedStringKey.font:UIFont(name: "HelveticaNeue", size: 32.0)!])
        titleFormatted.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(r: 251, g: 98, b: 78), range: NSRange(location:3,length:2))
        
        let navLabel = UILabel()
        navLabel.textColor = UIColor.darkGray
        navLabel.attributedText = titleFormatted
        navLabel.sizeToFit()
        self.navigationItem.titleView = navLabel
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        navigationController?.navigationItem.backBarButtonItem?.tintColor = .black
        //colored bar
        let navBarSeparatorView = UIView()
        //navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        navBarSeparatorView.backgroundColor = UIColor(r: 251, g: 98, b: 78)
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 3)
    }
    
    private func setupLeftNavItems() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "icon2").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "icon3").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "icon4").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView:composeButton), UIBarButtonItem(customView:searchButton)]
    }
}

