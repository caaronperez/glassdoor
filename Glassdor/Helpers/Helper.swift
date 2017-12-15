//
//  Helpers.swift
//  Glassdor
//
//  Created by MCS Devices on 11/15/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

struct APIDetails {
  static let APIScheme = "http"
  static let APIHost = "api.glassdoor.com"
  static let APIParamPath =  "/api/api.htm"
}

struct APIEndPoints {
  static var success = "success"
  static var status = "status"
  static var jsessionid = "jsessionid"
  static var response = "response"
  static var attributionURL = "attributionURL"
  static var countReturned = "countReturned"
  static var cities = "cities"
  static var numJobs = "numJobs"
  static var name = "name"
  static var stateAbbreviation = "stateAbbreviation"
  static var stateName = "stateName"
  static var id = "id"
  static var latitude = "latitude"
  static var longitude = "longitude"
  static var jobTitles = "jobTitles"
  static var jobTitle = "jobTitle"
  static var employers = "employers"
  static var squareLogo = "squareLogo"
  static var rating = "rating"
  static var numberOfReviews = "numberOfReviews"
  static var starImageSrc = "starImageSrc"
  static var reviewsUrl = "reviewsUrl"
  static var payCurrencyCode = "payCurrencyCode"
  static var payCurrencySymbol = "payCurrencySymbol"
  static var payLow = "payLow"
  static var payMedian = "payMedian"
  static var payHigh = "payHigh"
  static var nextJobTitle = "nextJobTitle"
  static var frequency = "frequency"
  static var frequencyPercent = "frequencyPercent"
  static var nationalJobCount = "nationalJobCount"
  static var medianSalary = "medianSalary"
}

enum Sizes : Int {
    case smallText = 14
    case mediumText = 17
    case largeText = 20
    case smallHeight = 35
    case mediumHeigh = 43
    case largeHeight = 50
    case defaultShadowSize = 5
}

extension UIColor {
    static var defaultBackground: UIColor  { return UIColor(red:0.33, green:0.63, blue:0.25, alpha:1.0) }
    static var infoBackground: UIColor  { return UIColor(red:0.80, green:0.86, blue:0.78, alpha:1.0) }
    static var dangerBackground: UIColor  { return UIColor(red:0.80, green:0.29, blue:0.38, alpha:1.0) }
    static var defaultText: UIColor  { return UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0) }
    static var infoText: UIColor { return UIColor.black }
    static var dangerText: UIColor { return UIColor.defaultText }
}



