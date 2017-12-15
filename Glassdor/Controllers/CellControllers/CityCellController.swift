//
//  CityCellController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/14/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class CityCellController: UITableViewCell {

  @IBOutlet weak var nameCity: UILabel!
  @IBOutlet weak var numJobsCity: UILabel!
  var city: CityStats!
 
  override func awakeFromNib() {
    super.awakeFromNib()
    if city != nil {
        nameCity.text = city.name
        if let numJobs = city.numJobs {
            numJobsCity.text = "\(numJobs)"
        }
    }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
  }

}
