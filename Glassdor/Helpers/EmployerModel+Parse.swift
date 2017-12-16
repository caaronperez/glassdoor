//
//  EmployerModel+Parse.swift
//  Glassdor
//
//  Created by MCS Devices on 12/14/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import Foundation

extension EmployerModel {
    static func parsePostArray (postArray: [[String: Any]]) -> [EmployerModel] {
        
        // Model's Employer's array
        var employerModelArray: [EmployerModel] = []
        
        // Each element from the Employer's API
        postArray.forEach{
            // Optional Binding Unwrapping values
            if let responseSection = $0["response"] as? [String: Any] {
                if let employersData = responseSection["employers"] as? [[String: Any]] {
                    // Getting info for each employer
                    for employerInfo in employersData {
                        
                        // To Store the parsed elements from the AlaskaAirAPI
                        let employerModel = EmployerModel()
                        
                        // Optional Binding
                        if let nameEmployer = employerInfo["name"], let website = employerInfo["website"], let featuredReview = employerInfo["featuredReview"] as? [String: Any], let rating = employerInfo["compensationAndBenefitsRating"], let ceoInfo = employerInfo["ceo"] as? [String: Any], let squareLogo = employerInfo["squareLogo"] {
                            // Optional Binding
                            if let location = featuredReview["location"], let jobTitle = featuredReview["jobTitle"] {
                                employerModel.jobTitle = String(describing: jobTitle)
                                employerModel.location = String(describing: location)
                            }
                            
                            if let ceoName = ceoInfo["name"] {
                                employerModel.ceoName = String(describing: ceoName)
                            }
                            
                            employerModel.nameEmployer = String(describing: nameEmployer)
                            employerModel.website = String(describing: website)
                            employerModel.rating =  String(describing: rating)
                            employerModel.urlImage = String(describing: squareLogo)
                        }
                        
                        // Adding the model to the model's array
                        employerModelArray.append(employerModel)
                        
                    } // End for in each "employersInfo"
                } // End Optional Binding "employersData"
            } // End Optional Binding "responseSection"
        }// End for each cycle
        
        return employerModelArray
    }
}

