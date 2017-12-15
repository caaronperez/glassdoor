//
//  ProgressionCellController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/15/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class ProgressionCellController: UITableViewCell {

  @IBOutlet weak var jobTitle: UILabel!
  @IBOutlet weak var frequency: UILabel!
  @IBOutlet weak var frecuencyPercent: UILabel!
  @IBOutlet weak var jobCount: UILabel!
  @IBOutlet weak var medianSalary: UILabel!
  var job: Progression!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    if job != nil {
      jobTitle.text = job.nextJobTitle
      frequency.text = String(job.frequency)
      frecuencyPercent.text = String(format: "%.1f", job.frequencyPercent) + "%"
      if let jobs = job.nationalJobCount { jobCount.text =  "\(jobs) jobs" }
      if let medianSalary = job.medianSalary { self.medianSalary.text = "$ \(medianSalary)" }
    }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

}
