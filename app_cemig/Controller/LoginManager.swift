//
//  LoginManager.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 18/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin

class LoginManager : UIViewController{
    
func viewDidLoad() {
    
    // Add a custom login button to your app
    let loginButton = UIButton(type: .custom)
    loginButton.backgroundColor = UIColor.darkGray
    loginButton.frame = CGRect(x: 0, y:0, width:180, height:40);
    loginButton.setTitle("Entrar", for: .normal)
    

    // Handle clicks on the button
    loginButton.addTarget(self, action: Selector(("loginButtonClicked:")), for: UIControlEvents.touchUpInside)
    }

    // Once the button is clicked, show the login dialog
    func loginButtonClicked() {
        let loginManager = ViewController()
        loginManager.logIn(readPermissions: [ .publicProfile, .email ], viewController: nil) {
            loginResult in
            switch loginResult {
            case .Failed(let error):
                print(error)
            case .Cancelled:
                print("Login Cancelado pelo usuário")
            case .Success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Login Efetuado com Sucesso")
            }
        }
    }
}
