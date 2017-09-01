//
//  HomeModel.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-07-29.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import UIKit

class HomeModel: NSObject {
    
var workouts: [Workout] = {
    let sharedPhotoAdjustmentManager = PhotoAdjustmentManager()
    let photo1 = sharedPhotoAdjustmentManager.addfilter(image: #imageLiteral(resourceName: "kickboxingg"))
    let photo2 = sharedPhotoAdjustmentManager.addfilter(image: #imageLiteral(resourceName: "boxing"))
    let photo3 = sharedPhotoAdjustmentManager.addfilter(image: #imageLiteral(resourceName: "warmup-1"))
    let photo4 = sharedPhotoAdjustmentManager.addfilter(image: #imageLiteral(resourceName: "floyd"))
    
    let kickboxingWorkout = Workout(name: "KICKBOXING", bioText: "Kickboxing for a full-body workout", image:photo1)
    
    let boxingWorkout = Workout(name: "BOXING", bioText: "Boxing workout full-body workout", image: photo2)
    
    let warmupWorkout = Workout(name: "WARM-UP", bioText: "Warm-up for a safe workout", image: photo3)
    
    let floydWorkout = Workout(name: "BONUS", bioText: "Special Technique", image: photo4)
    
    return [warmupWorkout, kickboxingWorkout, boxingWorkout, floydWorkout]
}()

}

struct Workout {
    let name: String
    let bioText: String
    let image: UIImage
}

class PhotoAdjustmentManager {
    func addfilter(image: UIImage) -> UIImage {
        
        guard let cgimg = image.cgImage else {
            print("imageView doesn't have an image!")
            return image
        }
        let ciContext = CIContext()
        let coreImage = CIImage(cgImage: cgimg)
        
        let filter = CIFilter(name: "CIExposureAdjust")
        filter?.setValue(coreImage, forKey: kCIInputImageKey)
        filter?.setValue(-1.5, forKey: kCIInputEVKey)
        
        let cgImage = ciContext.createCGImage((filter?.outputImage!)!,
                                              from: (filter?.outputImage!.extent)!)
        let filteredImage = UIImage(cgImage: cgImage!)
        
        return filteredImage
    }
}
