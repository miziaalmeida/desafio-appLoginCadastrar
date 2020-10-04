//
//  ViewController.swift
//  desafio-LoginCadastrar
//
//  Created by Mizia Lima on 10/3/20.
//

import UIKit

class ViewController: UIViewController {
    var arrayUsuarios = [Usuario]()
    
    //MARK: Outlets
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    @IBOutlet weak var buttonCadastrarOutlet: UIButton!
    @IBOutlet weak var buttonLoginOutlet: UIButton!
    
    //MARK: Actions
    @IBAction func buttonActionCadastrar(_ sender: Any) {
        cadastrar()
    }
    @IBAction func buttonActionLogin(_ sender: Any) {
        logar()
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonCadastrarOutlet.isEnabled = true
        
        textFieldEmail.delegate = self
        textFieldSenha.delegate = self
        
    }
    
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
        for i in arrayUsuarios {
            if(i.getEmail() == textFieldEmail.text){
                if(i.getSenha() == textFieldSenha.text){
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
        limpa()
        return
    }
    
    func cadastrar(){
        for i in arrayUsuarios {
            if(i.getEmail() == textFieldEmail.text!){
                alerta("Usuário com cadastro existente!")
                return
            }
        }
        let usuario = Usuario(email: textFieldEmail.text!, senha: textFieldSenha.text!)
        arrayUsuarios.append(usuario)
        
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


extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldEmail {
            textFieldSenha.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
}
