//
//  JobProgressionController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/14/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class JobProgressionController: UIViewController {

    @IBOutlet weak var titled: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerSubtitle: UILabel!
    @IBOutlet weak var jobSearch: UITextField!
    
    @IBOutlet weak var informationTitleOne: UILabel!
    @IBOutlet weak var informationBodyOne: UILabel!
    @IBOutlet weak var informationTitleTwo: UILabel!
    @IBOutlet weak var informationBodyTwo: UILabel!
    @IBOutlet weak var informationTitleThree: UILabel!
    @IBOutlet weak var informationBodyThree: UILabel!
    
    @IBAction func didPressSearch(_ sender: UIButton) {
        performSegue(withIdentifier: segueIdentifiers.showProgressionFromForm.rawValue, sender: nil)
    }
    var information: [[String: String]] = [[:],[:],[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInformation()
        fillElements()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fillElements() {
        self.title = "Job Progression"
        titled.text = "Job Progression"
        headerImage.image = #imageLiteral(resourceName: "gls")
        headerTitle.text = "Getting ahead"
        headerTitle.whiteShadow()
        headerSubtitle.text = "Working up the ranks"
        headerSubtitle.whiteShadow()
        informationTitleOne.text = information[0]["title"]
        informationBodyOne.text = information[0]["body"]
        informationTitleTwo.text = information[1]["title"]
        informationBodyTwo.text = information[1]["body"]
        informationTitleThree.text = information[2]["title"]
        informationBodyThree.text = information[2]["body"]
        
    }
    
    func loadInformation() {
        information[0]["title"] = "When the Title Doesn't Match the Work"
        information[0]["body"] = "Job progression means more than getting a fancy new title, however. Chances are, when you earn a promotion, you've already been doing the work of someone higher up the food chain. If you're angling for a better title -- and the salary that goes with it -- you'll need to first increase your workload and level of expertise at your current job. Approach your supervisor and ask for greater responsibility or offer your assistance on a key initiative."
        information[1]["title"] = "Defining Job Progression for Your Employees"
        information[1]["body"] = "If you are already in charge and have been tasked with developing a defined career path for your employees, get cracking. Human Capital magazine reports that a 2012 Australian study found that two-thirds of finance professionals felt frustrated enough to look for new employment when their employers didn't do enough to define job progression. Long story short? Employees who work hard -- and regularly perform beyond their pay grades -- want official recognition. And the best way to demonstrate that you appreciate their commitment is by developing structured career goals for each title."
        information[2]["title"] = "Applying for a New Job"
        information[2]["body"] = "If you decide to take your career path elsewhere, adapt your resume so it reflects your responsibilities accurately. Chances are you earned additional tasks as you gained experience on the job. Even if your title didn't change, note the progression of tasks clearly so hiring managers can identify your valuable talents. This will demonstrate your importance to your current organization, and it will show that you are capable of learning new tasks and working as a team player."
        
    }
}

extension JobProgressionController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifiers.showProgressionFromForm.rawValue {
            if let nextViewController = segue.destination as? ProgressionController {
                if let search = jobSearch.text {
                    nextViewController.jobParam = search
                }
            }
        }
        
    }
}
