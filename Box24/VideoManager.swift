//
//  VideoManager.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-10-01.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import Foundation
import Photos

class VideoManager: NSObject {
    
    static let shared = VideoManager()
    
    func getVideoAsset() -> AVAsset? {
        //var assetCollection = PHAssetCollection()
        var video: AVAsset?
        //let fetchOptions = PHFetchOptions()
        //fetchOptions.predicate = NSPredicate(format: "title contains[c] bbg")
        
        let assets: PHFetchResult = PHAsset.fetchAssets(with: .video, options: nil)
            print(assets.count)
            if let phVideo: PHAsset = assets.firstObject {
                if let avVideo = convert(asset:phVideo) {
                    video = avVideo
                }
            }
        return video
    }
    
    private func convert(asset:PHAsset) -> AVAsset? {
        var avVideo: AVAsset?
        //check if video
        guard (asset.mediaType == PHAssetMediaType.video) else {
            print("Not a valid video media type")
            return nil
        }
        //convert PHAsset to AVAsset to play
        PHImageManager().requestAVAsset(forVideo: asset, options: nil) { (avAsset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable : Any]?) in
            if let video = avAsset {
                avVideo = video
            }
        }
        return avVideo
    }
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

//        let asset = asset as! AVURLAsset
//        let player = AVPlayer(url:  asset.url)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        self.navigationController?.present(playerViewController, animated: true) {
//            playerViewController.player!.play()
//        }

//func showPlayer() {
//    let height = view.frame.width * 9 / 16
//    let videoPlayerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
//    let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
//    view.addSubview(videoPlayerView)
//}
