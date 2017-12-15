//
//  Employers.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

struct EmployerStats {
  var id: Int!
  var name: String!
  var numJobs: Int!
  var squareLogo: String!
  var rating: String!
  var numberOfReviews: Int!
  var starImageSrc: String!
  var reviewsUrl: String!
  
  static func parse(employer: [String: Any]) ->EmployerStats {
    if let id = employer[APIEndPoints.id] as? Int, let name = employer[APIEndPoints.name] as? String, let numJobs = employer[APIEndPoints.numJobs] as? Int, let squareLogo = employer[APIEndPoints.squareLogo] as? String, let rating = employer[APIEndPoints.rating] as? String, let numberOfReviews = employer[APIEndPoints.numberOfReviews] as? Int, let starImageSrc = employer[APIEndPoints.starImageSrc] as? String, let reviewsUrl = employer[APIEndPoints.reviewsUrl] as? String {
      return EmployerStats(id: id, name: name, numJobs: numJobs, squareLogo: squareLogo, rating: rating, numberOfReviews: numberOfReviews, starImageSrc: starImageSrc, reviewsUrl: reviewsUrl)
    } else {
      return EmployerStats()
    }
  }
}

