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
        
        // Do any additional setup after loading the view.
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
    struct Valor: Decodable{
        let Valor: Double
    }
    
   
    
    @IBAction func CalcGasto(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let email = defaults.string(forKey: "EmailDefaults")
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
        let urlString = URL(string: "https://apicemig.azurewebsites.net/api/itemperfil/" + email!)
        if let url = urlString {
            _ = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let data = data {
                        DispatchQueue.main.async {
                            do {
                                let conta =  try JSONDecoder().decode(Valor.self, from: data)
                                let valorReal = currencyFormatter.string(from: NSNumber(value: conta.Valor))!
                                
                                let view = UIAlertController(title: "Calculo da Conta", message: "De acordo com seu perfil de consumo, sua conta de luz é de aproximadamente "+valorReal, preferredStyle: .alert)
                                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                                    //Do some thing here
                                    view.dismiss(animated: true) {() -> Void in }
                                })
                                view.addAction(ok)
                                self.present(view, animated: true) {() -> Void in }
                                
                            } catch _ {
                                let view = UIAlertController(title: "Erro ao calcular sua conta", message: "Favor tentar novamente mais tarde", preferredStyle: .alert)
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
    @IBAction func Voltar(_ sender: UIButton) {
        let viewController:UIViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
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
                    
                 self.LimparTela()
                })
                view.addAction(ok)
                self.present(view, animated: true) {() -> Void in }
                
            case .failure(_):
                let view = UIAlertController(title: "Ops! Algo deu errado", message: "Registro não pode ser realizado.", preferredStyle: .alert)
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
