//
//  Usuario.swift
//  appLogin
//
//  Created by Mizia Lima on 9/16/20.
//  Copyright © 2020 Mizia Lima. All rights reserved.
//

import Foundation

class Usuario {
    private var email: String
    private var senha: String
    
    init(email: String, senha: String) {
        self.email = email
        self.senha = senha
    }
    
    func getEmail() -> String {
        return self.email
    }
    func getSenha() -> String {
        return self.senha
    }
    func setEmail(_ email:String){
        self.email = email
    }
    func setSenha(_ senha: String){
        self.senha = senha
    }
}
