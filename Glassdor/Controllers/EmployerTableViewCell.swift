//
//  EmployerTableViewCell.swift
//  Glassdor
//
//  Created by MCS Devices on 12/14/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class EmployerTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var labelNameEmployer: UILabel!
    @IBOutlet weak var labelWebsite: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
