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
    var root: [SearchItem] = []
    
    func loadData(){
        if defaults.string(forKey: "EmailDefaults") != nil {
            
            let urlString = URL(string: "https://apicemig.azurewebsites.net/api/itemperfil/item/"+defaults.string(forKey: "EmailDefaults")!)
            if let url = urlString {
                _ = URLSession.shared.dataTask(with: url) {  (data, response, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        if let data = data {
                            DispatchQueue.main.async {
                                do {
                                    self.root = try JSONDecoder().decode([SearchItem].self, from: data)
                                    self.tableView.reloadData()
                                    
                                } catch _ {
                                    let view = UIAlertController(title: "Falha ao carregar dados", message: "Favor executar logon novamente", preferredStyle: .alert)
                                    let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                                        //Do some thing here
                                        view.dismiss(animated: true) {() -> Void in }
                                    })
                                    view.addAction(ok)
                                    self.present(view, animated: true) {() -> Void in }
                                }
                            }
                        }
                    }
                    }.resume()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Perfil de Itens"
        tableViewControllerSetup()
        loadData()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = false
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
        
        return root.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "ConsumerProfileTableViewCellController") as? ConsumerProfileTableViewCellController else {return UITableViewCell()}
        
        cell.equipamentoLabel.text = root[indexPath.row].descricao
        cell.diasTextField.text = root[indexPath.row].diasUso
        cell.minutosTextField.text = root[indexPath.row].minutosUso
        cell.horasTextField.text = root[indexPath.row].horasUso
        cell.potenciaTextField.text = root[indexPath.row].potencia
        cell.potenciaSBTextField.text = root[indexPath.row].potenciaSB
        cell.quantidadeLabel.isHidden = true
        cell.quandidadeTextField.isHidden = true
        return cell       
    }
}

