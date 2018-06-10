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

struct SearchItem: Codable{
    let nomeEquipamento: Int64
    let dias: String
    let horas: String
    let minutos: String
    let potencia:String
    let potenciaSB: Int
    let quatidade: Int
}

class ConsumerProfileTableViewController: UITableViewController {
    
    // MARK: - Tables Views
    @IBOutlet var tableViewController: UITableView!

    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewControllerSetup()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return 1000
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "ConsumerProfileTableViewCellController") as? ConsumerProfileTableViewCellController else {fatalError()}
       // cell = .equipamentoLabel.text = iten[indexPath.row].nomeEquioamento
        
        //Esses aqui sao imutáveis
         cell.equipamentoLabel.text = "NOME DO EQUIPAMENTO"
         cell.quantidadeLabel.text = "Qtd.: "
         cell.diasLabel.text = "Dias: "
         cell.tempoUsoLabel.text = "Tempo de Uso "
         cell.potencia.text = "Pot.: "
         cell.potenciaSBLabel.text = "Pot. SB: "
         cell.horasLabel.text = "Hrs.: "
         cell.minutosLabel.text = "Min.: "
         cell.w1Label.text = "W"
         cell.w2Label.text = "W"
        
        if defaults.string(forKey: "EmailDefaults") != nil {
            
            let urlString = URL(string: "https://apicemig.azurewebsites.net/api/usuario/email/"+defaults.string(forKey: "EmailDefaults")!)
            if let url = urlString {
                _ = URLSession.shared.dataTask(with: url) {
                    (data, response, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        if let data = data {
                            DispatchQueue.main.async {
                                do {
                                    let item =  try JSONDecoder().decode(SearchItem.self, from: data)
                                    
                                    cell.quandidadeTextField.text = item.quatidade as? String
                                    cell.diasTextField.text = item.dias
                                    cell.minutosTextField.text = item.minutos
                                    cell.horasTextField.text = item.horas
                                    cell.potenciaTextField.text = item.potencia as? String
                                    cell.potenciaSBTextField.text = item.potenciaSB as? String
                                    
                                    
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
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
