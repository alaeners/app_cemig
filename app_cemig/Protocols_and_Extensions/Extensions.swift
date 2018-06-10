//
//  Extensions.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 10/06/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

// MARK: - Setup
extension ConsumerProfileTableViewController {
    
    func tableViewControllerSetup() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 350
        
        // NOTE: - Registering the cell programmatically
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ConsumerProfileTableViewCell")
        
    }
    
}


// MARK: - Table View Delegate
//extension ConsumerProfileTableViewController: UITableViewDelegate {
//
//}

//// MARK: - Table View Data Source
//extension ConsumerProfileTableViewController: UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1000
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsumerProfileTableViewCell")
//        cell?.textLabel?.text = "Funcionou até aqui "
//        return cell!
//    }


