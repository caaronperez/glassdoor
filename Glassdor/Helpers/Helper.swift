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

