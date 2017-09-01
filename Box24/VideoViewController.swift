//
//  VideoViewController.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-08-12.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Photos

class VideoViewController: AVPlayerViewController {
    
    let playWorkout: Workout
    var asset = PHAsset()
    
    init(workout:Workout) {
        playWorkout = workout
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getVideos()
        
    }
    
    
    
    private func playVideo(asset:PHAsset) {
        
        guard (asset.mediaType == PHAssetMediaType.video)
            
            else {
                print("Not a valid video media type")
                return
        }

                
                let player = AVPlayer(URL: asset.URL)
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                view.presentViewController(playerViewController, animated: true) {
                    playerViewController.player!.play()
      
    }
    
//    private func playVideo() {
//        let fm = FileManager.default
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        guard let items = try? fm.contentsOfDirectory(atPath: path) else {
//            //display error
//            return
//        }
//        
//        for item in items {
//            if item.hasPrefix("video") {
//                let player = AVPlayer(url: URL(fileURLWithPath: item))
//                let playerController = AVPlayerViewController()
//                playerController.player = player
//                present(playerController, animated: true) {
//                    player.play()
//            }
//        }
//        guard let path = Bundle.main.path(forResource: "video", ofType:"mp4") else {
//            debugPrint("video.m4v not found")
//            return
//        }
        }
    }
    
    private func getVideos() {
        //var assetCollection = PHAssetCollection()
        
        //var assets = [PHAsset]()
        let fetchOptions = PHFetchOptions()
        //fetchOptions.predicate = NSPredicate(format: "title contains[c] bbg")
        let assets: PHFetchResult = PHAsset.fetchAssets(with: .video, options: nil)
        print(assets.count)
        if let _: AnyObject = assets.firstObject{
            //found the album
            asset = assets.firstObject!
            playVideo(asset:asset)
            //print(asset)
        }
//        else { let albumFound = false }
//        var i = collection.count
//        //var photoAssets = PHAsset.fetchAssets(in: assetCollection, options: nil)
//        let imageManager = PHCachingImageManager()
//        
//        assets.enumerateObjects({(object: AnyObject!,
//            count: Int,
//            stop: UnsafeMutablePointer<ObjCBool>) in
//            
//            if object is PHAsset{
//                let asset = object as! PHAsset
//                print("Inside  If object is PHAsset, This is number 1")
//                
//                let imageSize = CGSize(width: asset.pixelWidth,
//                                       height: asset.pixelHeight)
//                
//                /* For faster performance, and maybe degraded image */
//                let options = PHImageRequestOptions()
//                options.deliveryMode = .fastFormat
//                options.isSynchronous = true
//                imageManager.requestImage(for: asset,
//                                          targetSize: imageSize,
//                                          contentMode: .aspectFill,
//                                          options: options,
//                                          resultHandler: {
//                                            image, info in
//                                            let photo = image
//                                            /* The image is now available to us */
//                                            //self.sendPhotos(self.photo)
//                                            print("enum for image, This is number 2")
//                                            
//                                            
//                })
//            }
//        })
    }
}


