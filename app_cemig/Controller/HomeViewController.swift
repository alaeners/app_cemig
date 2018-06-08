//
//  HomeViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 20/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    
    //Acesso a API de Busca de usuário
    struct SearchUser: Codable{
        let cpf: Int64
        let nome: String
        let email: String
        let password: String
        let data_nasc:String
        let cep: Int
        let rua: String
        let number: Int
        let bairro: String
        let uf: String
        let complemento: String
        let localidade: String
    }
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
        
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
                                    let user =  try JSONDecoder().decode(SearchUser.self, from: data)
                                    self.nameLabel.text! = user.nome
                                    self.idadeLabel.text! = user.data_nasc
                                    self.cpfLabel.text! =  String(user.cpf)
                                    self.emailLabel.text! = user.email
                                    
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoffButton(_ sender: UIButton) {
        let viewController:UIViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
    }
    
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cpfLabel: UILabel!
    @IBOutlet var idadeLabel: UILabel!
    
    @IBAction func viewProfileConsumer(_ sender: Any) {
        
        
        let viewController:UIViewController = UIStoryboard(name: "ConsumerProfile", bundle: nil).instantiateViewController(withIdentifier: "ConsumerProfileStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
        
    }
    
    @IBAction func profileConsumerAddButton(_ sender: UIButton) {
        let viewController:UIViewController = UIStoryboard(name: "AddProfile", bundle: nil).instantiateViewController(withIdentifier: "AddProfileStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
    }
    
    @IBAction func editProfileButton(_ sender: UIButton) {
        let viewController:UIViewController = UIStoryboard(name: "EditUser", bundle: nil).instantiateViewController(withIdentifier: "EditUserViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
  
    }
    
    @IBAction func deleteProfileButton(_ sender: UIButton) {
        let deleteUser = defaults.string(forKey: "EmailDefaults")
        if deleteUser != nil {
            let urlString = URL(string: "https://apicemig.azurewebsites.net/api/usuario/email/"+deleteUser!)
            
            Alamofire.request(urlString!, method: .delete, parameters: nil, encoding: URLEncoding.default).responseJSON{ response in
                switch response.result {
                case .success:
                    let view = UIAlertController(title: "Dados Excluídos", message: "Registro excluído com sucesso", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                        //Do some thing here
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainStoryboard") as UIViewController
                        
                        self.present(viewController, animated: false, completion: nil)
                        
                        view.dismiss(animated: true) {() -> Void in }
                    })
                    view.addAction(ok)
                    self.present(view, animated: true) {() -> Void in }
                    
                case .failure(_):
                    let view = UIAlertController(title: "Ops! Algo deu errado", message: "Registro não pode ser excluído.", preferredStyle: .alert)
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
    
}
