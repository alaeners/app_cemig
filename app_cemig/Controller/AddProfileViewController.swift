//
//  AddProfileViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 02/06/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class AddProfileViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var potenciaTextField: UITextField!
    @IBOutlet var diasUsoTextField: UITextField!
    @IBOutlet var horasTextField: UITextField!
    @IBOutlet var MinutosTextField: UITextField!
    @IBOutlet var qtdTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Adicionando Itens"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func LimparTela(){
        self.nomeTextField.text = ""
        self.potenciaTextField.text = ""
        self.qtdTextField.text = ""
        self.diasUsoTextField.text = ""
        self.horasTextField.text = ""
        self.MinutosTextField.text = ""
    }
    
    @IBAction func Voltar(_ sender: UIButton) {
        let viewController:UIViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewStoryboard") as UIViewController
        
        //self.navigationController?.popViewController(animated: true)
        //self.present(viewController, animated: false, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func AddItem(_ sender: UIButton) {
        
        if Int(self.diasUsoTextField.text!)! > 30
        {
            
        }
        
        let defaults = UserDefaults.standard
        let email = defaults.string(forKey: "EmailDefaults")
        
        let parametersUser = [
            "descricao": self.nomeTextField.text!,
            "potencia": self.potenciaTextField.text!,
            "quantidade": self.qtdTextField.text!,
            "DiasUso": self.diasUsoTextField.text!,
            "HorasUso": self.horasTextField.text!,
            "MinutosUso": self.MinutosTextField.text!,
            "email": email!
        ]
        
        let url = "https://apicemig.azurewebsites.net/api/itemperfil"
        Alamofire.request(url, method:.post, parameters:parametersUser, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                
                let view = UIAlertController(title: "Dados Salvos", message: "Item Cadastrado com sucesso", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    //Do some thing here
                    view.dismiss(animated: true) {() -> Void in }
                    self.LimparTela()
                })
                view.addAction(ok)
                self.present(view, animated: true) {() -> Void in }
                
            case .failure(_):
                let view = UIAlertController(title: "Ops! Algo deu errado", message: "Registro não pode ser realizado.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    //Do some thing herefree
                    view.dismiss(animated: true) {() -> Void in }
                })
                view.addAction(ok)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
