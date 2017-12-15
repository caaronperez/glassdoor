//
//  StatusViewController.swift
//  Glassdor
//
//  Created by MCS on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    
    var dataRecived: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGetClassDataSetData(dataRecived: dataRecived)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red:0.33, green:0.64, blue:0.25, alpha:1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setGetClassDataSetData(dataRecived: Any?){
        if dataRecived  is EmployerStats {
            // touch.view is of type UIPickerView
            loadEmployeStats(dataRecived: dataRecived as! EmployerStats)
        }
        if dataRecived is JobStats {
            loadJobStats(dataRecived: dataRecived as! JobStats)
        }
        if dataRecived is CityStats {
            loadCityeStats(dataRecived: dataRecived as! CityStats)
        }
        else {
            let alertMenu = UIAlertController(title: "No results", message: Constants.errorAlertNoResults , preferredStyle: .alert)
            let alertOption = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertMenu.addAction(alertOption)
            self.present(alertMenu, animated: true)
        }
    }
    
    func loadEmployeStats(dataRecived: EmployerStats){
        titleLabel.text = Constants.employerStatsTitle
        label1.text = String(dataRecived.id)
        label2.text = dataRecived.name
        label3.text = String(dataRecived.numJobs)
        label4.text = dataRecived.rating
        label5.text = dataRecived.reviewsUrl
        label6.text = dataRecived.squareLogo
        label7.text = dataRecived.starImageSrc
    }
    func loadJobStats(dataRecived: JobStats){
        titleLabel.text = Constants.jobStatsTitle
        label1.text = String(dataRecived.id)
        label2.text = dataRecived.jobTitle
        label3.text = String(dataRecived.numJobs)
        label4.isHidden = true
        label5.isHidden = true
        label6.isHidden = true
        label7.isHidden = true
    }
    func loadCityeStats(dataRecived: CityStats){
        titleLabel.text = Constants.cityStatsTitle
        label1.text = String(dataRecived.id)
        label2.text = String(dataRecived.latitude)
        label3.text = String(dataRecived.longitude)
        label4.text = dataRecived.name
        label5.text = String(dataRecived.numJobs)
        label6.text = dataRecived.stateAbbreviation
        label7.text = dataRecived.stateName
    }
    
    
}

