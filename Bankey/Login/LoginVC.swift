//
//  ViewController.swift
//  Bankey
//
//  Created by Ethan Gonsalves on 2023-01-07.
//

import UIKit

protocol LoginVCDelegate: AnyObject {
    func didLogin()
}

class LoginVC: UIViewController {
    let signInButton = UIButton(type: .system)
    let loginView = LoginView()
    let errorMessageLabel = UILabel()
    let logo = UILabel()
    let subTitle = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    weak var delegate: LoginVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        layout()
    }
    
   
    
    
}

extension LoginVC {
    private func style() {
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.text = "Your premium source for all things banking!"
        subTitle.numberOfLines = 0
        subTitle.textColor = .black
        subTitle.textAlignment = .center
        subTitle.font = .systemFont(ofSize: 25)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.text = "Bankey"
        logo.numberOfLines = 0
        logo.textColor = .black
        logo.textAlignment = .center
        logo.font = .systemFont(ofSize: 35)
      
        
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
 
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(logo)
        view.addSubview(subTitle)
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            
            signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 8),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            signInButton.heightAnchor.constraint(equalToConstant: 30),
            
            
            errorMessageLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 8),
            errorMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
            subTitle.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -20),
            subTitle.widthAnchor.constraint(equalToConstant: 270),
            subTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logo.bottomAnchor.constraint(equalTo: subTitle.topAnchor, constant: -30),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            
        ])
        
    }
}


extension LoginVC {
    @objc func signInTapped() {
        errorMessageLabel.isHidden = false
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("username and password should never be nil")
            return
            
        }
        
        if (username.isEmpty || password.isEmpty){
            configureView("Username / password cannot be blank")
            return
        }
        
        if username == "1" && password == "1" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView("Incorrect username / password ")
        }
        
        
    }
    private func configureView(_ message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
    
}


 
