//
//  IdentificationViewController.swift
//  API Calling
//
//  Created by zamin ahmed on 3/3/19.
//  Copyright © 2019 zamin ahmed. All rights reserved.
//

import UIKit

class IdentificationViewController: UITableViewController {
   
    var ID = [[String:String]]()
    var details = [String:String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ID Details"
        let query = " http://api.citybik.es/v2/networks"
        if let url = URL(string: query){
            if let data = try?  Data(contentsOf:url){
                let json = try! JSON(data:data)
                self.parse(json:json)
            }
            else{
                self.loadError()
            }
        }
    }
    
    
    
    
    func parse(json:JSON){
        for result in json["networks"].arrayValue{
            let id = result["id"].stringValue
            let href = result["href"].stringValue
            let details = ["id": id, "href":href]
            ID.append(details)
        }
        DispatchQueue.global(qos:.userInitiated).async{
            [unowned self] in
            self.tableView.reloadData()
        }
    }
    
    func loadError() {
        let alert = UIAlertController(title: "Loading Error", message:"There was a problem loading the bikes", preferredStyle:.actionSheet)
        alert.addAction(UIAlertAction(title:"Ok", style: .default, handler:nil))
        present(alert,animated:true, completion:nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ID.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        let Identifications = ID[indexPath.row]
        cell.textLabel?.text = Identifications["id"]
        cell.detailTextLabel?.text = Identifications["href"]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string:ID[indexPath.row]["url"]!)
        UIApplication.shared.open(url! as URL,options:[:], completionHandler: nil)
        
    }
}
