//
//  JobStats.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

struct JobStats {
  var id: Int!
  var jobTitle: String!
  var numJobs: Int!

 /* init() {}
  
  init(id: Double, jobTitle: String, numJobs: String) {
    self.id = id
    self.jobTitle = jobTitle
    self.numJobs = numJobs
  }*/
  
  static func parse(job: [String: Any]) ->JobStats {
    if let id = job[APIEndPoints.id] as? Int, let jobTitle = job[APIEndPoints.jobTitle] as? String, let numJobs = job[APIEndPoints.numJobs] as? Int {
      return JobStats(id: id, jobTitle: jobTitle, numJobs: numJobs)
    }else {
      return JobStats()
    }
  }
}
