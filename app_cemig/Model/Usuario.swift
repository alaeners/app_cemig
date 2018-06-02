//
//  UsuarioRequest.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 02/06/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import Foundation
import Alamofire

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

