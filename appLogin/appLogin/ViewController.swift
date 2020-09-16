//
//  ViewController.swift
//  appLogin
//
//  Created by Mizia Lima on 9/15/20.
//  Copyright © 2020 Mizia Lima. All rights reserved.
//

import UIKit

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

class ViewController: UIViewController {

    @IBOutlet weak var textFielEmail: UITextField!
    @IBOutlet weak var textFielSenha: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    
    @IBAction func btnLoginAction(_ sender: Any) {
    }
    
    @IBAction func btnCadastrarAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFielEmail.delegate = self
        textFielSenha.delegate = self
    }
}

// Cria a extension para determinar o comportamento dos delegates
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFielEmail {
            textFielSenha.becomeFirstResponder()
        }
        if textField == textFielSenha {
            textField.resignFirstResponder()
        }
        return true
    }
}

