//
//  NetworkManager.swift
//
//  Created by Cristian Aaron on 12/7/17.
//  Copyright © 2017 Cristian Aaron. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkManagerDelegate: class {
  func didDownloadInformation(response: [String: Any])
}

protocol NetworkManagerDelegateAlert: class {
  func showAlert(message: String, title: String, first: Bool)
}

protocol NetworkManagerImage: class {
  func didDownloadImage(image: UIImage)
}

protocol NetworkManagerRating: class {
  func didDownloadRating(image: UIImage)
}
