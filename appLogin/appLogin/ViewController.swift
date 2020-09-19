//
//  ViewController.swift
//  appLogin
//
//  Created by Mizia Lima on 9/15/20.
//  Copyright © 2020 Mizia Lima. All rights reserved.
//

import UIKit

// MARK: ViewController
class ViewController: UIViewController {

// MARK: Outlets
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    
// MARK: Properties
    var usuariosCadastrados = [Usuario]()
    
// MARK: Actions
    @IBAction func btnLoginAction(_ sender: Any) {
        if verificar()
    }
    
    @IBAction func btnCadastrarAction(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
    super.viewDidLoad()

    textFieldEmail.delegate = self
    textFieldSenha.delegate = self
    
    }
    
    // MARK: Funcoes
    
    func alerta(_ message: String){
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel){
            (UIAlertAction) in
        }
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    func limpa() {
        textFieldEmail.text = ""
        textFieldSenha.text = ""
    }

    func logar(){
        for i in usuariosCadastrados {
            if(i.getEmail() == textFielEmail.text){
                if(i.getSenha() == textFielSenha.text){
                    limpa()
                    
                    alerta("Login realizado!")
                    return
                }
                else {
                alerta("Senha incorreta!")
                return
            }
        }
    }
        alerta("Usuário não cadastrado!")
        return
    }
    
    func cadastrar(){
        for i in usuariosCadastrados {
                if(i.getEmail() == textFielEmail.text!){
                    alerta("Usuário com cadastro existente!")
                        return
            }
        }
        let usuario = Usuario(email: textFieldEmail.text!, senha: textFieldSenha.text!)
        usuariosCadastrados.append(usuario)
        
        limpa()
        
        alerta("Cadastro realizado com sucesso!")
        
        return
    }
    
    private func verificar() -> Bool {
        if textFieldEmail == nil{
            return false
        }
        if textFieldSenha.text == nil || textFieldSenha.text!.isEmpty {
            return false
        }
        return true
    }
    
    
    
}

// Cria a extension para determinar o comportamento dos delegates
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == textFieldEmail {
            if let email = textFieldEmail.text, !email.isEmpty {
            }
        }
    }
}
