//
//  ViewController.swift
//  Glassdor
//
//  Created by MCS Devices on 11/15/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

struct identifiers {
    static let employerTableViewCell = "cellEmployer"
    static let employerSegue = "segueShowEmployer"
}

class CompanyViewController: UIViewController {
    // MARK: Properties
    var employerModelArray: [EmployerModel] = []
    var networkRequests: [Any?] = []
    var state: String?
    var keyWord: String?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Functions
    func setUpTableView () {
        // Settings Table View
        tableView.layer.cornerRadius = 15.0
        tableView.layer.borderColor = UIColor(red:0.86, green:0.86, blue:0.86, alpha:1.0).cgColor
        tableView.layer.borderWidth = 3.0
        tableView.rowHeight = 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get new data
        let myNetworkManager = NetworkManager()
        networkRequests.append(myNetworkManager)
        myNetworkManager.delegate = self
        myNetworkManager.downloadAPIPosts(keyWord: keyWord ?? "", state: state ?? "")
        
        // To configure our table view
        setUpTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: Extensions

// - Extension Network Manager
extension CompanyViewController: NetworkManagerDelegate {
    func didDownloadParsedPostArray(postArray: [EmployerModel]) {
        // Set data to our array
        employerModelArray = postArray
        
        // Reload table view with the new data
        tableView.reloadData()
    }
}

// - Extension Table View
extension CompanyViewController: UITableViewDataSource {
    // Number of cells in Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employerModelArray.count
    }
    
    // Content of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifiers.employerTableViewCell, for: indexPath) as! EmployerTableViewCell
        
        if let nameEmployer = employerModelArray[indexPath.row].nameEmployer, let website = employerModelArray[indexPath.row].website, let location = employerModelArray[indexPath.row].location {
            
            cell.labelNameEmployer.text = nameEmployer
            cell.labelWebsite.text = website
            cell.labelLocation.text = location
        }
        
        // To alternate background color in our rows
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.98, alpha:1.0)
        } else {
            cell.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        }
        
        // Style bottom border
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
        
        return cell
    }
} // End of UITableViewDataSource extension

extension CompanyViewController: UITableViewDelegate {
    // To detect row selected for the segue action (segueShowEmployer)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: identifiers.employerSegue, sender: nil)
    }
}

extension CompanyViewController {
    // Data to send to the next ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Verify which row was chosen
        if segue.identifier == identifiers.employerSegue {
            // Validate assignation of a V.C. segue destination, chosing the row
            if let nextViewController = segue.destination as? EmployersInfoViewController, let indexRow = tableView.indexPathForSelectedRow?.row {
                nextViewController.currentModel = employerModelArray[indexRow]
            }
        }
    }
}

