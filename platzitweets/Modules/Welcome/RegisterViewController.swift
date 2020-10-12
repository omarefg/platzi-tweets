//
//  RegisterViewController.swift
//  platzitweets
//
//  Created by Omar Flores on 10/10/20.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD

class RegisterViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var namesTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func registerButtonAction() {
        view.endEditing(true)
        performRegister()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        registerButton.layer.cornerRadius = 25
    }
    
    private func performRegister() {
        guard let email = emailTextField.text, !email.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar un correo.", style: .warning).show()
            return
        }
        
        guard let names = namesTextField.text, !names.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar nombre y apellido.", style: .warning).show()
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar una contraseña.", style: .warning).show()
            return
        }
        
        let request = RegisterRequest(email: email, password: password, names: names)
        
        SVProgressHUD.show()
       
        SN.post(endpoint: Endpoints.register, model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            SVProgressHUD.dismiss()
            switch response {
            case .success:
                self.performSegue(withIdentifier: "showHome", sender: nil)
            case .error(let error):
                NotificationBanner(title: "Error", subtitle: error.localizedDescription, style: .danger).show()
            case .errorResult(let errorResponse):
                NotificationBanner(title: "Error", subtitle: errorResponse.error, style: .warning).show()
                return
            }
        }
    }

}
