//
//  RegisterViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 20/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Foundation


class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // colocando mask nos campos
        cpfTextField.delegate = self
        cepTextField.delegate = self
        emailRegisterTextField.delegate = self
        confEmailRegisterTextField.delegate = self
        passwordRegisterTextField.delegate = self
        confPasswordRegisterTextField.delegate = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Textfields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var ruaTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var ufTextField: UITextField!
    @IBOutlet weak var complementoTextField: UITextField!
    @IBOutlet weak var emailRegisterTextField: UITextField!
    @IBOutlet weak var confEmailRegisterTextField: UITextField!
    @IBOutlet weak var passwordRegisterTextField: UITextField!
    @IBOutlet weak var confPasswordRegisterTextField: UITextField!
    
    @IBOutlet weak var localidadeTextField: UITextField!
    // MARK: - Labels
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cepLabel: UILabel!
    @IBOutlet weak var ruaLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var bairroLabel: UILabel!
    @IBOutlet weak var ufLabel: UILabel!
    @IBOutlet weak var complementoLabel: UILabel!
    @IBOutlet weak var emailRegisterLabel: UILabel!
    
    @IBOutlet weak var confEmailRegisterLabel: UITextField!
    @IBOutlet weak var passwordRegisterLabel: UILabel!
    @IBOutlet weak var confPasswordRegisterLabel: UILabel!
    
    @IBOutlet weak var localidadeLabel: UILabel!
    
    // MARK: -  Constants
    struct Cep: Codable {
        let cep: String
        let uf: String
        let localidade: String
        let bairro: String
        let logradouro: String
        let complemento: String
        let unidade: String
        let ibge: String
        let gia: String
        
    }
    
    // MARK: - Buttons
    @IBAction func findCEPButton(_ sender: Any) {
        
        let urlString = URL(string: "https://viacep.com.br/ws/"+cepTextField.text!+"/json")
        if let url = urlString {
            _ = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let data = data {
                        DispatchQueue.main.async {
                            do {
                                let cep =  try JSONDecoder().decode(Cep.self, from: data)
                                self.ruaTextField.text! = cep.logradouro
                                self.bairroTextField.text! = cep.bairro
                                self.ufTextField.text! = cep.uf
                                self.cepTextField.text! = cep.cep
                                self.localidadeTextField.text! = cep.localidade
                                
                            } catch let jsonErr {
                                print("Error serializing json", jsonErr)
                            }
                        }
                    }
                }
                }.resume()
        }
    }
    
    @IBAction func cancelRegisterButton(_ sender: UIButton) {
    }
    
    @IBAction func saveRegisterButton(_ sender: UIButton) {
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: Funcs
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case cpfTextField:
            if string.count == 0 {
                return true
            }
            if (textField.text?.count ?? 0) > 13 {
                return false
            }
            if (textField.text?.count ?? 0) == 3 || (textField.text?.count ?? 0) == 7 {
                textField.text = textField.text ?? "" + (".")
            } else if (textField.text?.count ?? 0) == 11 {
                textField.text = textField.text ?? "" + ("-")
            }

            
        case dateTextField: break
            
        case cepTextField: break
        case emailRegisterTextField: break
        case confEmailRegisterTextField: break
        case passwordRegisterTextField: break
        case confPasswordRegisterTextField: break
            
            
        default:
            break
        }
                    return true
    }
    
    
}
