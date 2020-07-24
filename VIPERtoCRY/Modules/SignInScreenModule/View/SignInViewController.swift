//
//  SignInViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import NeatLayout

protocol SingInViewInput: class {
    
}

class SignInViewController: UIViewController {
    
    var presenter: SignInViewOutput?
    var textFieldView = UIView()
    var titleLabel = UILabel()
    var enterInfoLabel = UILabel()
    var incorrectInfoLabel = UILabel()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var signInButton = UIButton()
    var signUpButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        
    }
    @objc private func tap(sender: UIButton!) {
        presenter?.signUpTapped()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SignInViewController: SingInViewInput {
    
}



extension SignInViewController {
    private func setupSubviews() {
        view.clipsToBounds = true
        navigationController?.navigationBar.isHidden = true
        incorrectInfoLabel.isHidden = true
        view.backgroundColor = .orange
        
        titleLabel.text = "Welcome to VIPER!"
        titleLabel.font = UIFont(name: "GillSans-UltraBold", size: 48)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 80)
        
        enterInfoLabel.text = "Sign in to continue, please"
        enterInfoLabel.textColor = .white
        enterInfoLabel.font = .italicSystemFont(ofSize: 16)
        enterInfoLabel.textAlignment = .center
        enterInfoLabel.numberOfLines = 1
        view.addSubview(enterInfoLabel)
        enterInfoLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        enterInfoLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 30)
        enterInfoLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        enterInfoLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        
        incorrectInfoLabel.text = "Incorrect E-mail or Password! Try again."
        incorrectInfoLabel.textColor = .red
        incorrectInfoLabel.font = .boldSystemFont(ofSize: 16)
        incorrectInfoLabel.textAlignment = .center
        incorrectInfoLabel.numberOfLines = 1
        view.addSubview(incorrectInfoLabel)
        incorrectInfoLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        incorrectInfoLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 30)
        incorrectInfoLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        incorrectInfoLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        
        loginTextField.placeholder = "E-mail"
        loginTextField.backgroundColor = .white
        loginTextField.borderStyle = .roundedRect
        loginTextField.keyboardType = .emailAddress
        loginTextField.clearButtonMode = .always
        loginTextField.keyboardAppearance = .dark
        loginTextField.returnKeyType = .default
        view.addSubview(loginTextField)
        loginTextField.layer.masksToBounds = true
        loginTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        loginTextField.autoPinEdge(.top, to: .bottom, of: incorrectInfoLabel, withOffset: 50)
        loginTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        loginTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.keyboardType = .default
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.clearButtonMode = .always
        passwordTextField.keyboardAppearance = .dark
        passwordTextField.returnKeyType = .default
        passwordTextField.isSecureTextEntry = false //TODO: add eye selector
        view.addSubview(passwordTextField)
        passwordTextField.layer.masksToBounds = true
        passwordTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        passwordTextField.autoPinEdge(.top, to: .bottom, of: loginTextField, withOffset: 10)
        passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        signInButton.backgroundColor = .black
        signInButton.setTitle("Enter to your account", for: .normal)
        signInButton.tintColor = .white
        signInButton.titleColor(for: .highlighted)
        view.addSubview(signInButton)
        signInButton.clipsToBounds = true
        signInButton.layer.cornerRadius = 15
        signInButton.autoSetDimensions(to: CGSize(width: 20, height: 45))
        signInButton.autoAlignAxis(toSuperviewAxis: .vertical)
        signInButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: 60)
        signInButton.autoPinEdge(toSuperviewEdge: .right, withInset: 65)
        signInButton.autoPinEdge(toSuperviewEdge: .left, withInset: 65)
        
        signUpButton.backgroundColor = .black
        signUpButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        signUpButton.setTitle("Sign up for free", for: .normal)
        signUpButton.tintColor = .white
        signUpButton.titleColor(for: .focused)
        view.addSubview(signUpButton)
        signUpButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 15
        signUpButton.autoSetDimensions(to: CGSize(width: 20, height: 45))
        signUpButton.autoAlignAxis(toSuperviewAxis: .vertical)
        signUpButton.autoPinEdge(.top, to: .bottom, of: signInButton, withOffset: 20)
        signUpButton.autoPinEdge(toSuperviewEdge: .right, withInset: 65)
        signUpButton.autoPinEdge(toSuperviewEdge: .left, withInset: 65)
    }
}
