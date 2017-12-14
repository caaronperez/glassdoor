//
//  CityStats.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class CityStats: NSObject {
  var numJobs: Int
  var name: String
  var stateAbbreviation: String
  var stateName: String
  var id: Double
  var latitude: Double
  var longitude: Double
  
  init(numJobs: Int, name: String, stateAbbreviation: String, stateName: String, id: Double, latitude: Double, longitude: Double){
    self.numJobs = numJobs
    self.name = name
    self.stateAbbreviation = stateAbbreviation
    self.stateName = stateName
    self.id = id
    self.latitude = latitude
    self.longitude = longitude
  }
  
}
