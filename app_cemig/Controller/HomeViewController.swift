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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
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
                                    print(user.nome)
                                    self.nameLabel.text! = user.nome
                                    self.idadeLabel.text! = "26"
                                    self.cpfLabel.text! =  String(user.cpf)
                                    
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
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cpfLabel: UILabel!
    @IBOutlet var idadeLabel: UILabel!
    
    
    @IBAction func profileConsumerButton(_ sender: UIButton) {
        
        let viewController:UIViewController = UIStoryboard(name: "ConsumerProfile", bundle: nil).instantiateViewController(withIdentifier: "ConsumerProfileViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
    }
    
    
    
    @IBAction func editProfileButton(_ sender: UIButton) {
        let viewController:UIViewController = UIStoryboard(name: "EditUserStoryboard", bundle: nil).instantiateViewController(withIdentifier: "EditUserViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
        
        
        
    }
    @IBAction func deleteProfileButton(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        let email = defaults.string(forKey: "EmailDefaults")
        
        let userDelete: String = "https://apicemig.azurewebsites.net/api/usuario/email/"+email!
        Alamofire.request(userDelete, method: .delete).responseJSON {
            response in
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                let view = UIAlertController(title: "Informações Inválidas", message: "Ocorreu um erro na execução, favor tente novamente", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    //Do some thing here
                    view.dismiss(animated: true) {() -> Void in }
                })
                view.addAction(ok)
                self.present(view, animated: true) {() -> Void in }
                
                if let error = response.result.error {
                    
                    let view = UIAlertController(title: "Error ", message: (error as! String), preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                        //Do some thing here
                        view.dismiss(animated: true) {() -> Void in }
                    })
                    view.addAction(ok)
                    self.present(view, animated: true) {() -> Void in }
                    
                }
                return
            }
            let view = UIAlertController(title: "Sucesso! ", message: "Usuário deletado com sucesso, favor fechar o aplicativo", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                //Do some thing here
                view.dismiss(animated: true) {() -> Void in }
            })
            view.addAction(ok)
            self.present(view, animated: true) {() -> Void in }
        }        
    }
}
