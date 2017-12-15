//
//  CityStats.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

struct CityStats {
  var numJobs: Int!
  var name: String!
  var stateAbbreviation: String!
  var stateName: String!
  var id: Int!
  var latitude: Double!
  var longitude: Double!
  
  
  static func parse(city: [String: Any]) ->CityStats{
    if let numJobs = city[APIEndPoints.numJobs] as? Int, let name = city[APIEndPoints.name] as? String, let stateAbbreviation = city[APIEndPoints.stateAbbreviation] as? String, let stateName = city[APIEndPoints.stateName] as? String, let id = city[APIEndPoints.id] as? Int, let latitude = city[APIEndPoints.latitude] as? Double, let longitude = city[APIEndPoints.longitude] as? Double
    {
      return CityStats(numJobs: numJobs, name: name, stateAbbreviation: stateAbbreviation, stateName: stateName, id: id, latitude: latitude, longitude: longitude)
    }else {
      return CityStats()
    }
  }
}
