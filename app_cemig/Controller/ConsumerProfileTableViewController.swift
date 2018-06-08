//
//  ConsumerProfileViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 01/06/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class BetterTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetup()

        // Do any additional setup after loading the view.
    }

}

extension BetterTableViewController {
    
    func tableViewSetup() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 350
        
        // NOTE: - Registering the cell programmatically
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BetterTableViewCell")
    }
    
}

// MARK: - Table View Delegate
extension BetterTableViewController: UITableViewDelegate {
    
}

// MARK: - Table View Data Source
extension BetterTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BetterTableViewCell")
        cell?.textLabel?.text = "Wow much better"
        return cell!
    }
    
}

    //MARK: - Labels
    //MARK: - TextFields
    //MARK: - Buttons    

