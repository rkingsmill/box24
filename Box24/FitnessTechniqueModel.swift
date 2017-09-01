//
//  FitnessTechniqueModel.swift
//  Box24
//
//  Created by Rosalyn Kingsmill on 2017-07-29.
//  Copyright © 2017 Rosalyn Kingsmill. All rights reserved.
//

import Foundation

class FitnessTechniqueModel: NSObject {
    
    let fitnessOrTechnique: [Workout] = {
        let pAM = PhotoAdjustmentManager()
        let photo1 = pAM.addfilter(image: #imageLiteral(resourceName: "fitness"))
        let photo2 = pAM.addfilter(image: #imageLiteral(resourceName: "technique"))
        let fitnessWorkout = Workout(name: "FITNESS", bioText: "Increase cardio, strength and agility", image:photo1)
        
        let techniqueWorkout = Workout(name: "TECHNIQUE", bioText: "Improve ", image: photo2)
        
        return [fitnessWorkout, techniqueWorkout]
    }()

}
