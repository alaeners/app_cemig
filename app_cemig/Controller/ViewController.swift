//
//  ViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 18/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit
import Foundation
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // Once the button is clicked, show the login dialog
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Buttons
    
    @IBAction func loginFBButton(_ sender: UIButton) {
        loginButtonClicked()
    }
    
    func loginButtonClicked() {
        let loginManager = LoginManager()
        
        loginManager.logIn(readPermissions: [ .publicProfile, .email], viewController: self)
        { LoginResult in
            switch LoginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("Login Cancelado pelo usuário -- se cancelado volta para a tela principal do app")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Login Efetuado com Sucesso--- na verdade aqui abre se a home ou a tela de cadastro para atualizar informações, ou seja eu farei essa validação aqui" )
                
                
            }
        }
    }
    
    
}

