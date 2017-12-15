//
//  Progression.swift
//  Glassdor
//
//  Created by MCS Devices on 12/15/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

struct Progression {
    
    var nextJobTitle: String!
    var frequency: Int!
    var frequencyPercent: Double!
    var nationalJobCount: Int!
    var medianSalary: Int!
    
    
    static func parse(progression: [String: Any]) ->Progression {
        if let nextJobTitle = progression[APIEndPoints.nextJobTitle] as? String, let frequency = progression[APIEndPoints.frequency] as? Int, let frequencyPercent = progression[APIEndPoints.frequencyPercent] as? Double, let nationalJobCount = progression[APIEndPoints.nationalJobCount] as? Int, let medianSalary = progression[APIEndPoints.medianSalary] as? Int
        {
            return Progression(nextJobTitle: nextJobTitle, frequency: frequency, frequencyPercent: frequencyPercent, nationalJobCount: nationalJobCount, medianSalary: medianSalary)
        }else {
            return Progression()
        }
    }
}
