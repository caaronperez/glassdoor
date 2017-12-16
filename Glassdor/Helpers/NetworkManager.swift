//
//  NetworkManager.swift
//  Glassdor
//
//  Created by MCS Devices on 12/13/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import Foundation

class NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?
    
    // To download the Alaska Air API
    func downloadAPIPosts(keyWord: String, state: String) {
        
        // Assigning the URL of the API
        let urlString = "http://api.glassdoor.com/api/api.htm?t.p=226784&t.k=egJHs4O7iCI&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&state=\(state)&q=\(keyWord)"
        
        print("\nURL String: \(urlString)")
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {data, response, err in
            do {
                if err != nil {
                    print(err as Any)
                } else {
                    if let jsonString = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] { // conditional casting.
                        
                        //print("\njsonString: \(jsonString)\n")
                        
                        // calling the serial main queue to handle the display of information faster.
                        DispatchQueue.main.async {
                            let postArray = EmployerModel.parsePostArray(postArray: [jsonString])
                            self.delegate?.didDownloadParsedPostArray(postArray: postArray)
                        } // End DispatchQueue
                    }
                }
            } catch {
                print("an error happened while parsing ")
                print(error.localizedDescription)
            }
        } // End of task assignation
        
        task.resume()
        
    } // End function downloadAPIPosts
} // End class NetworkManager
