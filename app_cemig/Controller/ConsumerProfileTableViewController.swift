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

class ConsumerProfileTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Labels
    @IBOutlet var nomeEquipamentoLabel: UILabel!
    
    //MARK: - TextFields
    @IBOutlet var quantidadeTextField: UITextField!
    @IBOutlet var diasTextField: UITextField!
    @IBOutlet var minutosTextField: UITextField!
    @IBOutlet var horasTextField: UITextField!
    @IBOutlet var potenciaTextField: UITextField!
    @IBOutlet var potenciaSBTextField: UITextField!
    
    //MARK: - Buttons
    @IBAction func ExcluirItemButton(_ sender: UIButton) {
    }
    
}
