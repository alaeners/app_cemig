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
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // NOTE: - Registering the cell programmatically
        tableView.register(ConsumerProfileTableViewCellController.self, forCellReuseIdentifier: "ConsumerProfileTableViewCell")
        
        
    }
}
//sim, eu comentei essa merda e esqueci kkkk pqp ISUAUHSUAHSU menos mal se for só isso, triste pq eu to a 3 dias sofrendo com isso KKKKKKK namoralzinha eu to puta aqui com
// mas quero que funfa vou cobrar pao de queijo aqui é 3,50

// é as duas coisas... tenho que apresentar esse trabalho na faculdade... porém preciso aprender o swift ... juntei o últil ao agradável TUDO IO :)
// mnentira a API quem fez foi pedro mas relacionado ao swift fui eu
//sim, pedro é my boy magia nós somos o casal lésbico mais bonito da faculdade KKKKKKKKK
// depois te mostro pq kkk


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


