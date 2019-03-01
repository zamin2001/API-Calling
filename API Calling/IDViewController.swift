//
//  IDViewController.swift
//  API Calling
//
//  Created by zamin ahmed on 3/1/19.
//  Copyright © 2019 zamin ahmed. All rights reserved.
//




import UIKit

class LocationDetailsViewController: UITableViewController {
    
    var Details = [[String:String]]()
    var Identification = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos:.userInitiated).async{
            [unowned self] in
            self.title = ""
            let query = "https://api.citybik.es/v2/networks"
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
    }
    
    func parse(json:JSON){
        for result in json["Identification"].arrayValue{
            let id = result["id"].stringValue
            let href = result["href"].stringValue
            let identification = ["id":id,"href":href]
            Details.append(identification)
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
        return Details.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        let detail = Details[indexPath.row]
        cell.textLabel?.text = detail["name"]
        cell.detailTextLabel?.text = detail["id"]
        return cell
        
    }
}


