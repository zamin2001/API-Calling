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
        if let url = URL(string: query){
            if let data = try?  Data(contentsOf:url){
                let json = try! JSON(data:data)
              parse(json:json)
            }
        }
    else{
            loadError()
    }
        
}
    
    
    
    func parse(json:JSON){
        for result in json["networks"].arrayValue{
            let id = result["id"].stringValue
           let name = result["name"].stringValue
            let network = ["id":id,"name":name]
           networks.append(network)
        
        }
      
        tableView.reloadData()
       
    
    }
    
    
    func loadError() {
        let alert = UIAlertController(title: "Loading Error", message:"There was a problem loading the bikes", preferredStyle:.actionSheet)
        alert.addAction(UIAlertAction(title:"Ok", style: .default, handler:nil))
        present(alert,animated:true, completion:nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return networks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        let network = networks[indexPath.row]
        cell.textLabel?.text = network["name"]
        cell.detailTextLabel?.text = network["id"]
        return cell
       
    }
    
    
}

