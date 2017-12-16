//
//  NetworkManagerDelegate.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import Foundation

protocol NetworkManagerDelegate: class {
    
    func didDownloadParsedPostArray(postArray:[EmployerModel])
    
}
