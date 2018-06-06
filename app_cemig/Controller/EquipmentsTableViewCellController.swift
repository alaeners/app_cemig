//
//  EquipmentsTableViewCell.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 06/06/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit

class EquipmentsTableViewCellController: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - Labels
    @IBOutlet var equipamentsLabel: UILabel!
    
    // MARK: - TextField
    @IBOutlet var qtdTextField: UITextField!
    @IBOutlet var daysTextField: UITextField!
    @IBOutlet var minTextField: UITextField!
    @IBOutlet var hrTextField: UITextField!
    @IBOutlet var potTextField: UITextField!
    @IBOutlet var potSBTextField: UITextField!
    
    // MARK: - Buttons
    @IBAction func DeleteItemButton(_ sender: UIButton) {
    }
    
    
}
