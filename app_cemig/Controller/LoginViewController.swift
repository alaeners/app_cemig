//
//  LoginViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 20/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    var emailTeste = "email@email.com"
    var senhaTeste = "senha123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TextFields
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Buttons
    
    @IBAction func loginButton(_ sender: UIButton) {
    emailTeste.append(emailTextField.text!)
       senhaTeste.append(passwordTextField.text!)
        
        if emailTeste.isEqual("email@email.com") && senhaTeste.isEqual("senha123"){
            //let hvc = HomeViewController.self
            //Login com sucesso e chama a Home
            let _:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as UIViewController
            
            self.performSegue(withIdentifier: "LoginHomeSegue", sender: self)
            
        } else {
            
            // Opa algo ta errado isso aí! Verifica email ou senha e mandamos um alertView na tela
            let view = UIAlertController(title: "Erro de Acesso", message: "Verifique seu e-mail ou senha e tente novamente", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                //Do some thing here
                view.dismiss(animated: true) {() -> Void in }
            })
            view.addAction(ok)
            present(view, animated: true) {() -> Void in }
            
        }
    }
    
    @IBAction func cancelButton(sender: UIButton) {        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
