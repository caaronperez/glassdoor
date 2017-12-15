//
//  CompanyCellController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/14/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class CompanyCellController: UITableViewCell {

  
  @IBOutlet weak var companyImage: UIImageView!
  @IBOutlet weak var companyName: UILabel!
  @IBOutlet weak var numJobsCompay: UILabel!
  @IBOutlet weak var ratingImage: UIImageView!
  @IBOutlet weak var companyRating: UILabel!
  var networkRequests: [Any?] = []
  var company: EmployerStats!

  override func awakeFromNib() {
    if company != nil {
      companyName.text = company.name
      if let numJobs = company.numJobs {
            numJobsCompay.text = "\(numJobs)"
      }

      companyRating.text = company.rating + "/5.0"
      let networkTest = NetworkManager()
      networkRequests.append(networkTest)
      networkTest.image = self
      networkTest.getImage(imgUrl: company.squareLogo)
      networkTest.rating = self
      networkTest.getRating(imgUrl: company.starImageSrc)
    }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
  }
}

extension CompanyCellController: NetworkManagerImage {
  func didDownloadImage(image: UIImage) {
    companyImage.image = image
  }
}

extension CompanyCellController: NetworkManagerRating {
  func didDownloadRating(image: UIImage) {
    ratingImage.image = image
  }
}

