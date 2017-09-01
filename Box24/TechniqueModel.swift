//
//  TechniqueModel.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-07-29.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import Foundation

class TechniqueModel: NSObject {

let technique: [Workout] = {
    let pAM = PhotoAdjustmentManager()
    let photo1 = pAM.addfilter(image: #imageLiteral(resourceName: "beginner"))
    let photo2 = pAM.addfilter(image: #imageLiteral(resourceName: "intermediate"))
    let photo3 = pAM.addfilter(image: #imageLiteral(resourceName: "advanced"))
    
    let beginner = Workout(name: "BEGINNER", bioText: "", image:photo1)
    let intermediate = Workout(name: "INTERMEDIATE", bioText: "", image: photo2)
    let advanced = Workout(name: "ADVANCED", bioText: "", image: photo3)
    
    return [beginner, intermediate, advanced]
}()
}
