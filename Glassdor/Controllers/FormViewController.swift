//
//  FormViewController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    
    @IBOutlet weak var keyWordsTxt: UITextField!
    @IBOutlet weak var companyTxt: UITextField!
    @IBOutlet weak var locationTxt: UITextField!
    @IBOutlet weak var sincePickerView: UIPickerView!
    @IBOutlet weak var jobTypePickerView: UIPickerView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var raitingPickerView: UIPickerView!
   
    var category = ""
    var jobType = ""
    var since = ""
    var rating = ""
    var keywords = ""
    var company = ""
    var location = ""
    @IBAction func searchBtn(_ sender: Any) {
        if let key = keyWordsTxt.text{
            keywords = key
        }
        if let comp = companyTxt.text{
            company = comp
        }
        if let loca = locationTxt.text{
            location = loca
        }
        var formDictionary: [String: String] = ["category": category, "jobType": jobType, "since": since, "rating": rating, "keywords": keywords, "company": company, "location": location]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension FormViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPickerView {
            return PickerValues.jobCategories[row]
        }else if pickerView == sincePickerView{
            return PickerValues.since[row]
        }else if pickerView == jobTypePickerView{
            return PickerValues.jobType[row]
        }else{
            return PickerValues.rate[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPickerView {
            category = String(row)
            print(category)
        }else if pickerView == sincePickerView{
            since = String(row)
            print(since)
        }else if pickerView == jobTypePickerView{
            jobType = PickerValues.jobType[row]
            print(jobType)
        }else{
            rating = PickerValues.rate[row]
            print(rating)
        }
    }
}

extension FormViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPickerView{
            return PickerValues.jobCategories.count
        }else if pickerView == sincePickerView{
            return PickerValues.since.count
        }else if pickerView == jobTypePickerView{
            return PickerValues.jobType.count
        }else{
            return PickerValues.rate.count
        }
        
    }
    
    
}
