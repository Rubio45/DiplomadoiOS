//
//  MainViewController.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 25/8/24.
//
import UIKit

class LoginViewController: UIViewController {
    
    private let passwordTextField = BuildHelper.createTextField(with: "Password", and: true)
    private let emailTextField = BuildHelper.createTextField(with: "Email", and: false)
    private let loginButton = BuildHelper.createMainButton(with: "Log in")
    private let forgotPasswordButton = BuildHelper.createSystemButton(with: "Forgot password?")
    private let signUpButton = BuildHelper.createSystemButton(with: "Sign up")
    private let imageView = BuildHelper.createImageView(from: "loginImage")
    
    private let password = "123456"
    private let email = "alex@chanchitofeliz.com"
    
    private let signUpLabel: UILabel = {
        let signUpLabel = UILabel()
        signUpLabel.text = "Don't have an account yet?"
        signUpLabel.textColor = UIColor.darkBlue
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        return signUpLabel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        // Placeholder image
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            // view.frame.height = 667 in iPhone SE.
            imageView.widthAnchor.constraint(equalToConstant: view.frame.height >= 700 ? 250 : 150),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height >= 700 ? 250 : 150)
        ])
        
        // Label Login
        let titleLabel = BuildHelper.createTitleLabel(with: "Log in")
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Email text field
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Password text field
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        // Log in button
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Forgot password button
        view.addSubview(forgotPasswordButton)
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        setupSignUpStack()
    }
    
    private func setupSignUpStack() {
        // Sign up button and label
        
        view.addSubview(signUpLabel)
        
        let signUpStack = UIStackView(arrangedSubviews: [signUpLabel, signUpButton])
        signUpStack.axis = .horizontal
        signUpStack.spacing = 5
        signUpStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpStack)
        
        NSLayoutConstraint.activate([
            signUpStack.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            signUpStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func loginButtonTapped() {
        
        if emailTextField.text == email && passwordTextField.text == password {
            print("Login successful")
            loginButton.setTitle("Login successful", for: .normal)
            loginButton.backgroundColor = .green
            setupUI()
            // hacer que la app espere para mostrar la vista
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                loginButton.setTitle("Log in", for: .normal)
                loginButton.backgroundColor = UIColor.mainColor
                setupUI()
                let vc = HomeViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        } else {
            print("Login failed")
            loginButton.setTitle("Wrong email or password", for: .normal)
            loginButton.backgroundColor = .red
            setupUI()
            // get back the button to normal
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                loginButton.setTitle("Log in", for: .normal)
                loginButton.backgroundColor = UIColor.mainColor
                setupUI()
            }
        }
        print("Login button tapped")
    }
}
