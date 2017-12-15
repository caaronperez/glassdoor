//
//  ResultsController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/14/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class ResultsController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var params: [String: Any] = ["v":1,"format":"json","t.p":236390,"t.k":"kUVzZKQVvGi","action":"jobs-stats","city":"New York","state":"NY","returnJobTitles":"true","q":"iOS","useragent":"Mozilla/%2F4.0","returnEmployers":"true","returnCities":"true"]
  
  var networkRequests: [Any?] = []
  var cities: [CityStats] = []
  var jobTitles: [JobStats] = []
  var employers: [EmployerStats] = []
  
  override func viewDidLoad() {
      super.viewDidLoad()
      networkCall()
  }
  
  func networkCall() {
    let networkTest = NetworkManager()
    networkRequests.append(networkTest)
    networkTest.delegate = self
    networkTest.alert = self
    networkTest.downloadAPIInformation(parameters: params)
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
    
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

extension ResultsController: NetworkManagerDelegate {
  func didDownloadInformation(response: [String : Any]) {
    if let cities = response["cities"] as? [[String:Any]]{
      for city in cities {
        let result = CityStats.parse(city: city)
        self.cities.append(result)
      }
    }
    
    if let jobTitles = response["jobTitles"] as? [[String:Any]] {
      for job in jobTitles {
        let result = JobStats.parse(job: job)
        self.jobTitles.append(result)
      }
    }
    
    if let employers = response["employers"] as? [[String:Any]] {
      for employer in employers {
        let result = EmployerStats.parse(employer: employer)
        self.employers.append(result)
      }
    }
    tableView.reloadData()
  }
}

extension ResultsController: NetworkManagerDelegateAlert {
  func showAlert(message: String, title: String, first: Bool) {
    
  }
}

extension ResultsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifiers.showInfoFromResults.rawValue, sender: nil)
    }
}

extension ResultsController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifiers.showInfoFromResults.rawValue {
            if let nextViewController = segue.destination as? StatsViewController {
                if tableView.indexPathForSelectedRow?.section == 0 {
                    nextViewController.dataRecived = employers[(tableView.indexPathForSelectedRow?.row)!]
                }
                else if tableView.indexPathForSelectedRow?.section == 1 {
                    nextViewController.dataRecived = jobTitles[(tableView.indexPathForSelectedRow?.row)!]
                }
                else {
                    nextViewController.dataRecived = cities[(tableView.indexPathForSelectedRow?.row)!]
                }
            }
        }
        
    }
}

extension ResultsController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
      case 1:
        return jobTitles.count
      case 2:
        return cities.count
      case 0:
        return employers.count
      default:
        return 0
    }
  }
  
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
      case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobCellController
        cell.job = jobTitles[indexPath.row]
        cell.awakeFromNib()
        return cell
      case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath) as! CompanyCellController
        cell.company = employers[indexPath.row]
        cell.awakeFromNib()
        return cell
      case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCellController
        cell.city = cities[indexPath.row]
        cell.awakeFromNib()
        return cell
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        return cell
    }
  }
  
  
  public func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  
  public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
    switch section {
      case 1:
        return "Job Titles"
      case 2:
        return "Cities"
      case 0:
        return "Companies"
      default:
        return "Unknow"
    }
  }
}







