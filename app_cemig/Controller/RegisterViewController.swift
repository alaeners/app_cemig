//
//  RegisterViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 20/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class RegisterViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
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
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    //Acesso a API de CEP
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
    //Acesso a API de Cadastro de usuário
    struct RegisterUser: Codable {
        let nameTextField: String
        let cpfTextField: String
        let dateTextField:String
        let ruaTextField: String
        let numberTextField: String
        let bairroTextField: String
        let ufTextField: String
        let complementoTextField: String
        let emailRegisterTextField: String
        let confEmailRegisterTextField: String
        let passwordRegisterTextField: String
        let confPasswordRegisterTextField: String
        let cep: String
        let uf: String
        let localidade: String
        let bairro: String
        let logradouro: String
        let complemento: String        
    }
    
    // MARK: - Buttons
    @IBAction func findCEPButton(_ sender: Any) {
        var cep = cepTextField.text?.replacingOccurrences(of: ".", with: "")
        cep = cep?.replacingOccurrences(of: "-", with: "")
        
        //json com método GET
        let urlString = URL(string: "https://viacep.com.br/ws/"+cep!+"/json")
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
                                
                            } catch _ {
                                let view = UIAlertController(title: "Erro ao Bsucar CEP", message: "O CEP Informado não pode ser localizado", preferredStyle: .alert)
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

    
    @IBAction func backButton(_ sender: UIButton) {
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainStoryboard") as UIViewController
        
            self.present(viewController, animated: false, completion: nil)
    }

    
    @IBAction func saveRegisterButton(_ sender: UIButton) {
        
        let validaFieldIsEmpty: Bool = true
        
        if validaFieldIsEmpty{
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
        setDadosInAPI()
    }
    
    //MARK: - Functions
    
    func setDadosInAPI(){
        
        var cpf = self.cpfTextField.text?.replacingOccurrences(of: ".", with: "")
        cpf = cpf?.replacingOccurrences(of: "-", with: "")
        
        var cep = self.cepTextField.text?.replacingOccurrences(of: ".", with: "")
        cep = cep?.replacingOccurrences(of: "-", with: "")
        
        let parametersUser = [
            "nome": self.nameTextField.text!,
            "cpf": cpf!,
            "data_nasc": self.dateTextField.text!,
            "cep": cep!,
            "rua": self.ruaTextField.text!,
            "number": self.numberTextField.text!,
            "bairro": self.bairroTextField.text!,
            "uf": self.ufTextField.text!,
            "complemento": self.complementoTextField.text!,
            "localidade": self.localidadeTextField.text!,
            "email": self.emailRegisterTextField.text!,
            "password": self.passwordRegisterTextField.text!
        ]
        
        let url = "https://apicemig.azurewebsites.net/api/usuario"
        Alamofire.request(url, method:.post, parameters:parametersUser, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                let defaults = UserDefaults.standard
                defaults.set(self.emailRegisterTextField.text!, forKey: "EmailDefaults")
                
                let view = UIAlertController(title: "Dados Salvos", message: "Registro Realizado com sucesso", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    //Do some thing here
                    let viewController:UIViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewStoryboard") as UIViewController
                    
                    self.present(viewController, animated: false, completion: nil)
                    view.dismiss(animated: true) {() -> Void in }
  
                })
                view.addAction(ok)
                self.present(view, animated: true) {() -> Void in }
                
            case .failure(_):
                let view = UIAlertController(title: "Ops! Algo deu errado", message: "Registro não pode ser realizado. Verifique CPF ou E-mail. Um deles já consta em nosso sistema!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    //Do some thing here
                    view.dismiss(animated: true) {() -> Void in }
                })
                view.addAction(ok)
                self.present(view, animated: true) {() -> Void in }
            }
        }
    }
    
    func cleanFields(){
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
    
    func camposIsEmpty(campo: UITextField){
        switch campo {
        case nameTextField:
            if nameTextField.text! == "" {showMessage()}
            break
        case cpfTextField:
            if cpfTextField.text! == "" {showMessage()}
            break
        case dateTextField:
            if dateTextField.text! == "" {showMessage()}
            break
        case cepTextField:
            if cepTextField.text! == "" {showMessage()}
            break
        case ruaTextField:
            if ruaTextField.text! == "" {showMessage()}
            break
        case numberTextField:
            if numberTextField.text! == "" {showMessage()}
            break
        case bairroTextField:
            if bairroTextField.text! == "" {showMessage()}
            break
        case ufTextField:
            if ufTextField.text! == "" {showMessage()}
            break
        case complementoTextField:
            if complementoTextField.text! == "" {showMessage()}
            break
        case emailRegisterTextField:
            if emailRegisterTextField.text! == "" {showMessage()}
            break
        case confEmailRegisterTextField:
            if confEmailRegisterTextField.text! == "" {showMessage()}
            break
        case passwordRegisterTextField:
            if passwordRegisterTextField.text! == "" {showMessage()}
            break
        case confPasswordRegisterTextField:
            if confPasswordRegisterTextField.text! == "" {showMessage()}
            break
        case localidadeTextField:
            if localidadeTextField.text! == "" {showMessage()}
            break
        default:
            return
        }
    }    
}
