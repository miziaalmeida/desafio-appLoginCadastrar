//
//  Usuario.swift
//  desafio-LoginCadastrar
//
//  Created by Mizia Lima on 10/3/20.
//

import Foundation

class Usuario {
    var email: String
    var senha: String
    
    init(email: String, senha: String) {
        self.email = email
        self.senha = senha
    }
    
    //Funcoes
    func getEmail() -> String {
        return self.email
    }
    
    func getSenha() -> String {
        return self.senha
    }
    
    func setEmail(_ email: String) {
        print(email)
        self.email = email
    }
    
    func setSenha(_ senha: String) {
        print(senha)
        self.senha = senha
    }
}
