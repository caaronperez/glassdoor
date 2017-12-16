//
//  FormEmployersViewController.swift
//  Glassdor
//
//  Created by MCS Devices on 12/14/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class FormEmployersViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var pickerState: UIPickerView!
    @IBOutlet weak var textFieldKeyWord: UITextField!
    @IBOutlet weak var buttonSearch: UIButton!
    
    // MARK: Properties
    var stateSelected: String?
    let arrayState = ["",
                      "Alaska",
                      "Alabama",
                      "Arkansas",
                      "American Samoa",
                      "Arizona",
                      "California",
                      "Colorado",
                      "Connecticut",
                      "District of Columbia",
                      "Delaware",
                      "Florida",
                      "Georgia",
                      "Guam",
                      "Hawaii",
                      "Iowa",
                      "Idaho",
                      "Illinois",
                      "Indiana",
                      "Kansas",
                      "Kentucky",
                      "Louisiana",
                      "Massachusetts",
                      "Maryland",
                      "Maine",
                      "Michigan",
                      "Minnesota",
                      "Missouri",
                      "Mississippi",
                      "Montana",
                      "North Carolina",
                      " North Dakota",
                      "Nebraska",
                      "New Hampshire",
                      "New Jersey",
                      "New Mexico",
                      "Nevada",
                      "New York",
                      "Ohio",
                      "Oklahoma",
                      "Oregon",
                      "Pennsylvania",
                      "Puerto Rico",
                      "Rhode Island",
                      "South Carolina",
                      "South Dakota",
                      "Tennessee",
                      "Texas",
                      "Utah",
                      "Virginia",
                      "Virgin Islands",
                      "Vermont",
                      "Washington",
                      "Wisconsin",
                      "West Virginia",
                      "Wyoming"]
    
    // MARK: Actions
    @IBAction func didPressSearch(_ sender: UIButton) {
        search()
    }
    
    func search() {
        if (stateSelected != "" && stateSelected != nil) || (textFieldKeyWord.text != "" && textFieldKeyWord.text != nil) {
            let employerVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! CompanyViewController
            employerVC.state = stateSelected
            employerVC.keyWord = textFieldKeyWord.text
            navigationController?.pushViewController(employerVC, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        
        textFieldKeyWord.delegate = self
        textFieldKeyWord.isUserInteractionEnabled = true
        
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

// MARK: Extension

// - Extension Picker View
extension FormEmployersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // Number of elements in PickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayState.count
    }
    
    // Number of columns in Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Content of the rows in the Picker View
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayState[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(arrayState[row])
        stateSelected = arrayState[row]
        
        buttonSearch.isEnabled = true
        buttonSearch.backgroundColor = UIColor(red:0.33, green:0.63, blue:0.25, alpha:1.0)
    }
}

// - Text Field Delegate
extension FormEmployersViewController: UITextFieldDelegate{
    
    // Textfield Delegate function to modify the behavior of textField

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textFieldKeyWord.text != "" {
            buttonSearch.isEnabled = true
            buttonSearch.backgroundColor = UIColor(red:0.33, green:0.63, blue:0.25, alpha:1.0)
        } else {
            buttonSearch.isEnabled = false
            buttonSearch.backgroundColor = UIColor(red:0.33, green:0.63, blue:0.25, alpha:0.5)
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search()
        return true
    }
    
}
