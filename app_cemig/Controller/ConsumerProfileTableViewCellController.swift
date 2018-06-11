//
//  ConsumerProfileTableViewCellController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 10/06/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit

class ConsumerProfileTableViewCellController: UITableViewCell {
    
    //MARK: - Labels
    @IBOutlet var equipamentoLabel: UILabel!
    @IBOutlet var quantidadeLabel: UILabel!
    @IBOutlet var diasLabel: UILabel!
    @IBOutlet var tempoUsoLabel: UILabel!
    @IBOutlet var potencia: UILabel!
    @IBOutlet var potenciaSBLabel: UILabel!
    @IBOutlet var horasLabel: UILabel!
    @IBOutlet var minutosLabel: UILabel!
    @IBOutlet var w1Label: UILabel!
    @IBOutlet var w2Label: UILabel!
    
    //MARK: - Text Field
    @IBOutlet var quandidadeTextField: UITextField!
    @IBOutlet var diasTextField: UITextField!
    @IBOutlet var minutosTextField: UITextField!
    @IBOutlet var horasTextField: UITextField!
    @IBOutlet var potenciaTextField: UITextField!
    @IBOutlet var potenciaSBTextField: UITextField!
    
    //MARK: - Image View
    @IBOutlet var imageViewCemig: UIImageView!
    
    //MARK: - Buttons
    @IBAction func deleteItemButton(_ sender: UIButton) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
