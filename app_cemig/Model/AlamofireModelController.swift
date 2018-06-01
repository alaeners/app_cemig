//
//  AlamofireModelController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 01/06/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireModelController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    public var URL_STRING: String
    
    // MARK: - .Post
    func alamofireDelete(){
        
    }
    
    func alamofireGet(){
        Alamofire.request(url, method: .post, parameters: numberCep)
       

        
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
    
    
    // MARK: - .Get
    
    
    
    // MARK: - .Delete
    
    
    // MARK: - .Put
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
