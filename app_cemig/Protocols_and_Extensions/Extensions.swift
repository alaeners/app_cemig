//
//  Extensions.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 23/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import Foundation
import UIKit

class ValidateEmail:UITextField{
    
    func validateEmail(Input:String) -> Bool {
    //verificando um símbolo @ seguido por pelo menos dois caracteres
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: Input)
    }
}

class ValidatePassword:UITextField{
    
    func validatePassword(Input:String) -> Bool {
    //Mínimo de 8 caracteres, pelo menos, 1 Alfabeto e 1 Número
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: Input)
    }    
}
