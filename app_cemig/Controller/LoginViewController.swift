//
//  LoginViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 20/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class LoginViewController: UIViewController {
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Usuário Cadastrado"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TextFields
    @IBOutlet public var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Buttons
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let parametersLogin = [
            "email": self.emailTextField.text!,
            "senha": self.passwordTextField.text!
        ]
        
        let defaults = UserDefaults.standard
        defaults.set(self.emailTextField.text!, forKey: "EmailDefaults")
        
        let url = "https://apicemig.azurewebsites.net/api/login"

        Alamofire.request(url, method:.post, parameters: parametersLogin, encoding: URLEncoding.default).response { response in
            switch response.response?.statusCode {
            case 200:
                let homeNavigationController = UINavigationController()

                let viewController:UIViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewStoryboard") as UIViewController
                homeNavigationController.viewControllers = [viewController]
                self.present(homeNavigationController, animated: false, completion: nil)

            case 401:

                // Opa algo ta errado isso aí! Verifica email ou senha e mandamos um alertView na tela
                let view = UIAlertController(title: "Erro de Acesso", message: "Verifique seu e-mail ou senha e tente novamente", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    //Do some thing here
                    view.dismiss(animated: true) {() -> Void in }
                })
                view.addAction(ok)
                self.present(view, animated: true) {() -> Void in }

            case .none:
                // Opa algo ta errado isso aí! Verifica email ou senha e mandamos um alertView na tela
                let view = UIAlertController(title: "Erro de Acesso", message: "Verifique seu e-mail ou senha e tente novamente", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    //Do some thing here
                    view.dismiss(animated: true) {() -> Void in }
                })
                view.addAction(ok)
                self.present(view, animated: true) {() -> Void in }
            case .some(_):
                // Opa algo ta errado isso aí! Verifica email ou senha e mandamos um alertView na tela
                let view = UIAlertController(title: "Erro de Acesso", message: "Verifique seu e-mail ou senha e tente novamente", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    //Do some thing here
                    view.dismiss(animated: true) {() -> Void in }
                })
                view.addAction(ok)
                self.present(view, animated: true) {() -> Void in }
            }
        }
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        emailTextField.text = ""
        passwordTextField.text = ""
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
    }
}
