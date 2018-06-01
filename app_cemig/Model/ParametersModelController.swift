//
//  ParametersModelController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 01/06/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit

class ParametersModelController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Métodos de Alamofire
    struct HTTPMethod: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    
    // MARK: - Enum para busca e retorno de CEP
    struct Cep: Codable {
        let cep: String
        let uf: String
        let localidade: String
        let bairro: String
        let logradouro: String
        let complemento: String
        let unidade: String
        let ibge: String
        let gia: String
        
    }
    
    // MARK: - Enum para inserção e retorno de dados de usuário
    struct RegisterUser: Codable {
        let nameTextField: String
        let cpfTextField: String
        let dateTextField:String
        let ruaTextField: String
        let numberTextField: String
        let bairroTextField: String
        let ufTextField: String
        let complementoTextField: String
        let emailRegisterTextField: String
        let confEmailRegisterTextField: String
        let passwordRegisterTextField: String
        let confPasswordRegisterTextField: String
        let cep: String
        let uf: String
        let localidade: String
        let bairro: String
        let logradouro: String
        let complemento: String
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
