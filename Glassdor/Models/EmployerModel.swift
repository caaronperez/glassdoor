//
//  EmployerModel.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import Foundation

class EmployerModel {
    // MARK: Properties
    var nameEmployer: String?
    var location: String?
    var jobTitle: String?
    var website: String?
    var rating: String?
    var ceoName: String?
    var urlImage: String?
    
    init() {
        
    }
    
    init (nameEmployer: String, location: String, jobTitle: String, website: String, rating: String, ceoName: String, urlImage: String) {
        self.jobTitle = jobTitle
        self.location = location
        self.nameEmployer = nameEmployer
        self.website = website
        self.rating = rating
        self.ceoName = ceoName
        self.urlImage = urlImage
    }
}
