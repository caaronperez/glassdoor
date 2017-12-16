//
//  EmployersInfoViewController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/14/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class EmployersInfoViewController: UIViewController {
    
    // MARK: Outlets
    var currentModel: EmployerModel?
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelWebsite: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelJobTitle: UILabel!
    @IBOutlet weak var labelCEO: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let nameEmployer = currentModel?.nameEmployer {
            navigationItem.title = "\(nameEmployer) Details"
        } else {
            navigationItem.title = "Employer Details"
        }
        
        if let name = currentModel?.nameEmployer, let location = currentModel?.location, let jobTitle = currentModel?.jobTitle, let website = currentModel?.website, let ceoName = currentModel?.ceoName, let rating = currentModel?.rating {
            labelName.text = name
            labelLocation.text = location
            labelWebsite.text = website
            labelJobTitle.text = jobTitle
            labelCEO.text = ceoName
            labelRating.text = rating
        }
        
        // Setting the logo
        if let imageName = currentModel?.urlImage {

            // We can force unwrap because we are 100% certain the constructor will not return nil in this case.
            let url = URL(string: imageName)!
            let data = try? Data(contentsOf: url)
            let image: UIImage = UIImage(data: data!)!

            imageViewLogo.image = image
        } else {
            imageViewLogo.image = #imageLiteral(resourceName: "jobDefaultLogo")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
