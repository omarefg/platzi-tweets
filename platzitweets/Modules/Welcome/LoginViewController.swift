//
//  LoginViewController.swift
//  platzitweets
//
//  Created by Omar Flores on 10/10/20.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD

class LoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func loginButtonAction() {
        view.endEditing(true)
        performLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        loginButton.layer.cornerRadius = 25
    }
    
    private func performLogin() {
        guard let email = emailTextField.text, !email.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar un correo.", style: .warning).show()
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar una contraseña.", style: .warning).show()
            return
        }
        
        let request = LoginRequest(email: email, password: password)
        
        SVProgressHUD.show()
       
        SN.post(endpoint: Endpoints.login, model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
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
