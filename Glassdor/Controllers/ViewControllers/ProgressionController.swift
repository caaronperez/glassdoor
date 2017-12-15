//
//  ProgressionControllerViewController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/15/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class ProgressionController: UIViewController {

    @IBOutlet weak var highPay: UILabel!
    @IBOutlet weak var medianPay: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currencySymbol: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var lowPay: UILabel!
    var jobParam = ""
    
    var params: [String: Any] = ["v":1,"format":"json","t.p":236390,"t.k":"kUVzZKQVvGi","action":"jobs-prog","useragent":"Mozilla/%2F4.0"]
    
    var networkRequests: [Any?] = []
    var progresions: [Progression] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        params["jobTitle"] = jobParam
        networkCall()
    }
    
    func networkCall() {
        let networkTest = NetworkManager()
        networkRequests.append(networkTest)
        networkTest.delegate = self
        networkTest.downloadAPIInformation(parameters: params)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ProgressionController: NetworkManagerDelegate {
    func didDownloadInformation(response: [String: Any]) {
        if let title = response["jobTitle"] as? String { self.title = title }
        if let payLow = response["payLow"] as? Double { self.lowPay.text = String(payLow) }
        if let payMedian = response["payMedian"] as? Double { self.medianPay.text = String(payMedian) }
        if let payHigh = response["payHigh"] as? Double { self.highPay.text = String(payHigh) }
        if let payCurrencySymbol = response["payCurrencySymbol"] as? String { self.currencySymbol.text = payCurrencySymbol }
      if let payCurrencyCode = response["payCurrencyCode"] as? String { self.currency.text = "Currency: \(payCurrencyCode)" }
        
        if let results = response["results"] as? [[String:Any]]{
            for result in results {
                let info = Progression.parse(progression: result)
                self.progresions.append(info)
            }
        }
      
        tableView.reloadData()
    }
}

extension ProgressionController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progresions.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressionCell", for: indexPath) as! ProgressionCellController
        cell.job = progresions[indexPath.row]
        if indexPath.row.isOdd() { cell.backgroundColor = UIColor(red:0.59, green:1.00, blue:0.54, alpha:1.0) }
        cell.awakeFromNib()
        return cell
    }
}
