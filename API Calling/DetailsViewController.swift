//
//  DetailsViewController.swift
//  API Calling
//
//  Created by zamin ahmed on 3/5/19.
//  Copyright © 2019 zamin ahmed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
   
    @IBOutlet weak var DetailsLabel: UILabel!
    
    var network = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailsLabel.text = "Identification: \(network["id"]!)\n href:\(network["href"]!)"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
