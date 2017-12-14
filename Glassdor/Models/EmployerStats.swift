//
//  Employers.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class EmployerStats: NSObject {

  var id: Int
  var name: String
  var numJobs: Int
  var squareLogo: String
  var rating: String
  var numberOfReviews: Int
  var starImageSrc: String
  var reviewsUrl: String
  
  init(id: Int, name: String, numJobs: Int, squareLogo: String, rating: String, numberOfReviews: Int, starImageSrc: String, reviewsUrl: String){
    self.id = id
    self.name = name
    self.numJobs = numJobs
    self.squareLogo = squareLogo
    self.rating = rating
    self.numberOfReviews = numberOfReviews
    self.starImageSrc = starImageSrc
    self.reviewsUrl = reviewsUrl
  }
}
