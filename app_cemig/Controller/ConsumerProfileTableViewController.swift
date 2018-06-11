//
//  ConumerProfileTableViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 10/06/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Foundation
import Alamofire


struct Item : Decodable {
    let Items : [SearchItem]
}

struct SearchItem: Decodable{
    let descricao: String
    let diasUso: String
    let horasUso: String
    let minutosUso: String
    let potencia:String
    let potenciaSB: String
    let quantidade: String
    let idItem: String
}

class ConsumerProfileTableViewController: UITableViewController {
    
    // MARK: - Tables Views
    @IBOutlet var tableViewController: UITableView!
    
    let defaults = UserDefaults.standard
    var fulaninho: [SearchItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fulaninho = defaults.object(forKey: "Vetor") as! [SearchItem]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.fulaninho.count
        }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "ConsumerProfileTableViewCellController") as? ConsumerProfileTableViewCellController else {fatalError()}
        
        //Esses aqui sao imutáveis
        cell.quantidadeLabel.isHidden = true
        cell.diasLabel.text = "Dias: "
        cell.tempoUsoLabel.text = "Tempo de Uso "
        cell.potencia.text = "Pot.: "
        cell.potenciaSBLabel.text = "Pot. SB: "
        cell.horasLabel.text = "Hrs.: "
        cell.minutosLabel.text = "Min.: "
        cell.w1Label.text = "W"
        cell.w2Label.text = "W"
        cell.quandidadeTextField.isHidden = true
        
        //self.fulaninho = root.count
        cell.equipamentoLabel.text = self.fulaninho[indexPath.row].descricao
        cell.diasTextField.text = self.fulaninho[indexPath.row].diasUso
        cell.minutosTextField.text = self.fulaninho[indexPath.row].minutosUso
        cell.horasTextField.text = self.fulaninho[indexPath.row].horasUso
        cell.potenciaTextField.text = self.fulaninho[indexPath.row].potencia
        cell.potenciaSBTextField.text = self.fulaninho[indexPath.row].potenciaSB
        
        
        
        return cell
    }
}

