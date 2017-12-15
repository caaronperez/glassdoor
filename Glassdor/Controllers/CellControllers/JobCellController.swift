//
//  JobCellController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/14/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class JobCellController: UITableViewCell {

  @IBOutlet weak var jobTitle: UILabel!
  @IBOutlet weak var numJobsTitle: UILabel!
  var job: JobStats!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    if job != nil {
      self.jobTitle.text = job.jobTitle
      
      if let numJobs = job.numJobs {
        numJobsTitle.text = "\(numJobs)"
      }
      
    }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
  }

}
