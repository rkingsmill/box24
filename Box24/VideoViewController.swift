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

class VideoViewController: UIViewController {
    
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
        let height = view.frame.width * 9 / 16
        let videoPlayerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
        view.addSubview(videoPlayerView)
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
