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
    
    var usuariosCadastrados = [Usuario]()
    
    
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
    
    //Funcoes
    func alerta(_ message: String){
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel){
            (UIAlertAction) in
        }
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    func limpa() {
        textFielEmail.text = ""
        textFielSenha.text = ""
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
        let usuario = Usuario(email: textFielEmail.text!, senha: textFielSenha.text!)
        usuariosCadastrados.append(usuario)
        
        limpa()
        
        alerta("Cadastro realizado com sucesso!")
        
        return
    }
}

// Cria a extension para determinar o comportamento dos delegates
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFielEmail {
            textFielSenha.becomeFirstResponder()
        }
        else {
            view.endEditing(true)
        }
        return true
    }
}
