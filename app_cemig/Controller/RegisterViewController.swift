//
//  RegisterViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 20/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Foundation


class RegisterViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    var bancoDeDados: [String: Any] = [:]    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        cpfTextField.delegate = self
        dateTextField.delegate = self
        cepTextField.delegate = self
        ruaTextField.delegate = self
        numberTextField.delegate = self
        bairroTextField.delegate = self
        ufTextField.delegate = self
        complementoTextField.delegate = self
        emailRegisterTextField.delegate = self
        confEmailRegisterTextField.delegate = self
        passwordRegisterTextField.delegate = self
        confPasswordRegisterTextField.delegate = self
        localidadeTextField.delegate = self
        scrollViewRegister.delegate = self
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollViewRegister.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollViewRegister.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    func showMessage(){
        // Opa algo ta vazio isso aí! Verifica os campos e tenta de novo
        let view = UIAlertController(title: "Campos Vazios", message: "Verifique as informações e tente novamente", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
            //Do some thing here
            view.dismiss(animated: true) {() -> Void in }
        })
        view.addAction(ok)
        present(view, animated: true) {() -> Void in }
        
        return
    }
    
    func camposIsEmpty(campo: UITextField) -> Bool {
        switch campo {
        case nameTextField:
            if nameTextField.text! == "" {
                showMessage()
            }
            
        case cpfTextField:
            if cpfTextField.text! == "" {
                showMessage()
            }
            
        case dateTextField:
            if dateTextField.text! == "" {
                showMessage()
            }
            
        case cepTextField:
            if cepTextField.text! == "" {
                showMessage()
            }
            
        case ruaTextField:
            if ruaTextField.text! == "" {
                showMessage()
            }
            
        case numberTextField:
            if numberTextField.text! == "" {
                showMessage()
            }
            
        case bairroTextField:
            if bairroTextField.text! == "" {
                showMessage()
            }
            
        case ufTextField:
            if ufTextField.text! == "" {
                showMessage()
            }
            
        case complementoTextField:
            if complementoTextField.text! == "" {
                showMessage()
            }
            
        case emailRegisterTextField:
            if emailRegisterTextField.text! == "" {
                showMessage()
            }
            
        case confEmailRegisterTextField:
            if confEmailRegisterTextField.text! == "" {
                showMessage()
            }
            
        case passwordRegisterTextField:
            if passwordRegisterTextField.text! == "" {
                showMessage()
            }
            
        case confPasswordRegisterTextField:
            if confPasswordRegisterTextField.text! == "" {
                showMessage()
            }
            
        case localidadeTextField:
            if localidadeTextField.text! == "" {
                showMessage()
            }
            
        default:
            let cpf: Int? = Int(cpfTextField.text!)
            let numberHouse: Int? = Int(numberTextField.text!)
            
            for _ in bancoDeDados {
                bancoDeDados["nome"] =  nameTextField.text!
                bancoDeDados["cpf"] =  cpf
                bancoDeDados["data_nasc"] =  dateTextField.text!
                bancoDeDados["cep"] =  cepTextField.text!
                bancoDeDados["rua"] =  ruaTextField.text!
                bancoDeDados["numberHouse"] =  numberHouse
                bancoDeDados["bairro"] =  bairroTextField.text!
                bancoDeDados["uf"] =  ufTextField.text!
                bancoDeDados["complemento"] =  complementoTextField.text!
                bancoDeDados["email"] =  emailRegisterTextField.text!
                bancoDeDados["password"] =  passwordRegisterTextField.text!
                
                let view = UIAlertController(title: "Salvou", message: "Registro Realizado com sucesso", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    //Do some thing here
                    view.dismiss(animated: true) {() -> Void in }
                })
                view.addAction(ok)
                present(view, animated: true) {() -> Void in }
            }
        }
        return true
    }
    //MARK: - Scrollviews
    @IBOutlet var scrollViewRegister: UIScrollView!
    
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
    @IBOutlet weak var confEmailRegisterLabel: UILabel!
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
        self.nameTextField.text = ""
        self.cpfTextField.text = ""
        self.dateTextField.text = ""
        self.cepTextField.text = ""
        self.ruaTextField.text = ""
        self.numberTextField.text = ""
        self.bairroTextField.text = ""
        self.ufTextField.text = ""
        self.complementoTextField.text = ""
        self.emailRegisterTextField.text = ""
        self.confEmailRegisterTextField.text = ""
        self.passwordRegisterTextField.text = ""
        self.confPasswordRegisterTextField.text = ""
        self.localidadeTextField.text = ""
    }
    
    @IBAction func saveRegisterButton(_ sender: UIButton) {
        
        camposIsEmpty(campo: nameTextField)
        camposIsEmpty(campo: cpfTextField)
        camposIsEmpty(campo: dateTextField)
        camposIsEmpty(campo: cepTextField)
        camposIsEmpty(campo: ruaTextField)
        camposIsEmpty(campo: numberTextField)
        camposIsEmpty(campo: bairroTextField)
        camposIsEmpty(campo: ufTextField)
        camposIsEmpty(campo: complementoTextField)
        camposIsEmpty(campo: emailRegisterTextField)
        camposIsEmpty(campo: confEmailRegisterTextField)
        camposIsEmpty(campo: passwordRegisterTextField)
        camposIsEmpty(campo: confPasswordRegisterTextField)
        camposIsEmpty(campo: localidadeTextField)

        
    
    }
    
    // MARK: Funcs
    

    
    func maskTextField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case cpfTextField:
            
            if string.count == 0 {
                return true
            }
            if (textField.text?.count ?? 0) > 11 {
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
