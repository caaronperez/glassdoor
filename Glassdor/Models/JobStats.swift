//
//  JobStats.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class JobStats: NSObject {
  var id: Int
  var jobTitle: String
  var numJobs: Int
  
  init(id: Int, jobTitle: String, numJobs: Int){
    self.id = id
    self.jobTitle = jobTitle
    self.numJobs = numJobs
  }
}
