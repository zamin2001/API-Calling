//
//  ViewController.swift
//  API Calling
//
//  Created by zamin ahmed on 2/22/19.
//  Copyright © 2019 zamin ahmed. All rights reserved.
//

import UIKit

class BikeViewController: UITableViewController {
    
    var bikes = [[String:String]]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Networks"
        let query = "  http://api.citybik.es/v2/networks"
       
    }


}

