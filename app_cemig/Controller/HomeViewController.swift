//
//  HomeViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 20/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    func loadDefaults(){
        let defaults = UserDefaults.standard
        let emailSession = defaults.object(forKey: "EmailDefaults") as! String
    }
    
    
    @IBAction func profileConsumerButton(_ sender: UIButton) {
        
        let viewController:UIViewController = UIStoryboard(name: "ConsumerProfile", bundle: nil).instantiateViewController(withIdentifier: "ConsumerProfileViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
    }
    
    
    
    @IBAction func editProfileButton(_ sender: UIButton) {
        let viewController:UIViewController = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
        
        
        
      
        
//        var email = cpfTextField.text!
//        
//        //json com método GET
//        let urlString = URL(string: "https://viacep.com.br/ws/"+cep!+"/json")
//        if let url = urlString {
//            _ = URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    print(error!)
//                } else {
//                    if let data = data {
//                        DispatchQueue.main.async {
//                            do {
//                                let cep =  try JSONDecoder().decode(Cep.self, from: data)
//                                self.ruaTextField.text! = cep.logradouro
//                                self.bairroTextField.text! = cep.bairro
//                                self.ufTextField.text! = cep.uf
//                                self.cepTextField.text! = cep.cep
//                                self.localidadeTextField.text! = cep.localidade
//                                
//                            } catch _ {
//                                let view = UIAlertController(title: "Erro ao Bsucar CEP", message: "O CEP Informado não pode ser localizado", preferredStyle: .alert)
//                                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
//                                    //Do some thing here
//                                    view.dismiss(animated: true) {() -> Void in }
//                                })
//                                view.addAction(ok)
//                                self.present(view, animated: true) {() -> Void in }
//                            }
//                        }
//                    }
//                }
//                }.resume()
//        }
        
    }
    @IBAction func deleteProfileButton(_ sender: UIButton) {

    }
}
