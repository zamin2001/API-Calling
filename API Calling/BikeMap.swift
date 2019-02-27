//
//  ViewController.swift
//  API Calling
//
//  Created by zamin ahmed on 2/22/19.
//  Copyright © 2019 zamin ahmed. All rights reserved.
//

import UIKit

class BikeViewController: UITableViewController {
    
    var networks = [[String:String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Networks"
        let query = "https://api.citybik.es/v2/networks"
    }
    func parse(json:JSON){
        for result in json["networks"].arrayValue{
            let company = result["company"].stringValue
            let id = result["id"].stringValue
            let location = result["location"].stringValue
            let network = ["company":company,"id":id,"location":location]
            networks.append(network)
            tableView.reloadData()
        }
    }
    
                func loadError() {
                    let alert = UIAlertController(title: "Loading Error",
                                                  message: "There was a problem loading the bikes location",
                                                  preferredStyle: .actionSheet)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
}

